import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/authenticated_user.dart';
import '../../../domain/usecase/get_users.dart';
import '../../login_screen.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<_GetAuthenticationStatus>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      final pref = await SharedPreferences.getInstance();

      if(pref.getString('token') == null){
        emit(state.copyWith(
          authenticationStatus : AuthenticationStatus.unauthenticated
        ) );
      }else{
        emit(state.copyWith(
          authenticationStatus: AuthenticationStatus.authenticated
        ));
      }

    });

    on<_AuthenticationLoginEvent>((event, emit) async {
      final response =
      await GetUserUseCase().call((event.username, event.password));

      response.either(
            (failure) {
          emit(state.copyWith(
              authenticationStatus: AuthenticationStatus.unauthenticated));
          event.onFailure('Failed to auth');
        },
            (user) {
              SharedPreferences.getInstance().then((value){
                value.setString('token', 'token');
              });
          emit(state.copyWith(
            authenticationStatus: AuthenticationStatus.authenticated,
            authenticatedUser: user,
          ));

          event.onSuccess();
        },
      );
    });

    
    on<_AuthenticationLogoutEvent>((event, emit) async {
      final pref = await SharedPreferences.getInstance();
      await pref.remove('token');
      emit(state.copyWith(authenticationStatus: AuthenticationStatus.unauthenticated));
    });

  }
}
