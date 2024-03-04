import 'package:go_router/go_router.dart';
import 'package:story_app_flutter/features/authentication/presentation/screen/authentication_screen.dart';
import 'package:story_app_flutter/features/details/presentation/screen/detail_screen.dart';
import 'package:story_app_flutter/features/stories/presentation/screen/home_screen.dart';
import 'package:story_app_flutter/splash_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/authentication',
      builder: (context, state) {
        return const AuthenticationScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'details/:id',
          name: "details",
          builder: (context, state) {
            return DetailScreen(id: state.pathParameters["id"]!);
          },
        ),
      ],
    )
  ],
);
