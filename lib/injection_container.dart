import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:story_app_flutter/features/authentication/data/datasources/remote/authentication_api_service.dart';
import 'package:story_app_flutter/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:story_app_flutter/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/get_user_token_usecase.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/user_login_usecase.dart';
import 'package:story_app_flutter/features/authentication/domain/usecases/user_register_usecase.dart';
import 'package:story_app_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:story_app_flutter/features/details/data/datasource/story_details_remote_datasource.dart';
import 'package:story_app_flutter/features/details/data/repository/story_details_repository_impl.dart';
import 'package:story_app_flutter/features/details/domain/repository/story_details_repository.dart';
import 'package:story_app_flutter/features/details/presentation/bloc/story_details_bloc.dart';
import 'package:story_app_flutter/features/stories/data/datasource/story_remote_datasource.dart';
import 'package:story_app_flutter/features/stories/data/repository/story_repository_impl.dart';
import 'package:story_app_flutter/features/stories/domain/repository/story_repository.dart';
import 'package:story_app_flutter/features/stories/domain/usecases/get_stories_usecase.dart';
import 'package:story_app_flutter/features/details/domain/usecases/get_story_details_usecase.dart';
import 'package:story_app_flutter/features/stories/presentation/bloc/story_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // SharedPreferences
  injector.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // Datasources
  injector
      .registerSingleton<AuthenticationApiService>(AuthenticationApiService());
  injector.registerSingleton<AuthenticationLocalDatasource>(
      AuthenticationLocalDatasource(injector()));
  injector.registerSingleton<StoryRemoteDatasource>(
      StoryRemoteDatasource(injector()));
  injector.registerSingleton<StoryDetailsRemoteDatasource>(
      StoryDetailsRemoteDatasource(injector()));

  // Repositories
  injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(injector(), injector()));
  injector.registerSingleton<StoryRepository>(StoryRepositoryImpl(injector()));
  injector.registerSingleton<StoryDetailsRepository>(
      StoryDetailsRepositoryImpl(injector()));

  // Usecases
  injector.registerSingleton<UserLoginUsecase>(UserLoginUsecase(injector()));
  injector
      .registerSingleton<UserRegisterUsecase>(UserRegisterUsecase(injector()));
  injector
      .registerSingleton<GetUserTokenUsecase>(GetUserTokenUsecase(injector()));
  injector.registerSingleton<GetStoriesUsecase>(GetStoriesUsecase(injector()));
  injector.registerSingleton<GetStoryDetailsUsecase>(
      GetStoryDetailsUsecase(injector()));

  // BLoCs
  injector.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(injector(), injector(), injector()));
  injector.registerFactory<StoryBloc>(() => StoryBloc(injector()));
  injector
      .registerFactory<StoryDetailsBloc>(() => StoryDetailsBloc(injector()));
}
