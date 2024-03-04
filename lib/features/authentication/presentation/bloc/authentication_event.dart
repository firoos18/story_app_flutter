part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  final LoginModel? loginModel;
  final RegisterModel? registerModel;

  const AuthenticationEvent({this.loginModel, this.registerModel});

  @override
  List<Object?> get props => [
        loginModel,
        registerModel,
      ];
}

final class LoginButtonTapped extends AuthenticationEvent {
  const LoginButtonTapped({super.loginModel});
}

final class RegisterButtonTapped extends AuthenticationEvent {
  const RegisterButtonTapped({super.registerModel});
}

final class ApplicationOpened extends AuthenticationEvent {}
