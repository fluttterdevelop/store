part of 'authentication_bloc.dart';

enum AuthenticationStatus{
  unknown,unauthenticated,authenticated
}

@freezed
class AuthenticationState with _$AuthenticationState{


  const factory AuthenticationState({
    @Default(AuthenticationStatus.unknown)
    AuthenticationStatus authenticationStatus,
    @Default(AuthenticatedUserEntity.empty())
    AuthenticatedUserEntity authenticatedUser,
}) = _AuthenticationState;
}
