
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store/features/main/presentation/main_screen.dart';

import '../bloc/auth/authentication_bloc.dart';
import '../login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state.authenticationStatus ==
              AuthenticationStatus.unauthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
            );
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state.authenticationStatus == AuthenticationStatus.unknown) {
            context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEvent.getAuthenticationStatus());
          }
          return 

               Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bola.png',
                    width: 150,
                    height: 150,
                  ),
                  Gap(20),
                  const CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      );
}
