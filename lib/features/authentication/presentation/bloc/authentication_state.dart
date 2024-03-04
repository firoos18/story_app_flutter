part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  final String? userToken;
  final RegisterResponseEntity? registerResponseEntity;
  final String? message;

  const AuthenticationState(
      {this.userToken, this.registerResponseEntity, this.message});

  @override
  List<Object?> get props => [
        userToken,
        registerResponseEntity,
        message,
      ];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {
  const LoginSuccess({super.userToken});
}

final class RegisterSuccess extends AuthenticationState {
  const RegisterSuccess({super.registerResponseEntity});
}

final class AuthenticationFailed extends AuthenticationState {
  const AuthenticationFailed({super.message});
}
