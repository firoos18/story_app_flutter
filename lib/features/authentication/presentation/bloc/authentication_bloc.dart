import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/register_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/get_user_token_usecase.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/user_login_usecase.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/user_register_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserLoginUsecase userLoginUsecase;
  final UserRegisterUsecase userRegisterUsecase;
  final GetUserTokenUsecase getUserTokenUsecase;

  AuthenticationBloc(
    this.userLoginUsecase,
    this.userRegisterUsecase,
    this.getUserTokenUsecase,
  ) : super(AuthenticationInitial()) {
    on<LoginButtonTapped>(onLoginButtonTapped);
    on<RegisterButtonTapped>(onRegisterButtonTapped);
    on<ApplicationOpened>(onApplicationOpened);
  }

  void onLoginButtonTapped(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final loginResponse = await userLoginUsecase.authenticationRepository
        .userLogin(event.loginModel);

    if (loginResponse != null) {
      loginResponse.fold(
        (left) => emit(AuthenticationFailed(message: left.message)),
        (right) => emit(LoginSuccess(userToken: right.loginResult.token)),
      );
    } else {
      emit(const AuthenticationFailed(message: "An Unknown Error Occured!"));
    }
  }

  void onRegisterButtonTapped(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final registerResponse = await userRegisterUsecase.authenticationRepository
        .userRegister(event.registerModel);

    if (registerResponse != null) {
      registerResponse.fold(
        (left) => emit(AuthenticationFailed(message: left.message)),
        (right) => emit(RegisterSuccess(registerResponseEntity: right)),
      );
    } else {
      emit(const AuthenticationFailed(message: "An Unknown Error Occured!"));
    }
  }

  void onApplicationOpened(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(AuthenticationLoading());

    final token =
        getUserTokenUsecase.authenticationRepository.retrieveUserToken();

    token.fold(
      (left) => emit(AuthenticationInitial()),
      (right) => emit(LoginSuccess(userToken: right)),
    );
  }
}
