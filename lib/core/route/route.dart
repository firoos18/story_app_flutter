import 'package:go_router/go_router.dart';
import 'package:story_app_flutter/features/add_story/presentation/screen/add_story_screen.dart';
import 'package:story_app_flutter/features/add_story/presentation/screen/map_picker_screen.dart';
import 'package:story_app_flutter/features/authentication/presentation/screen/authentication_screen.dart';
import 'package:story_app_flutter/features/details/presentation/screen/detail_screen.dart';
import 'package:story_app_flutter/features/settings/presentation/screen/settings_screen.dart';
import 'package:story_app_flutter/features/stories/presentation/screen/home_screen.dart';
import 'package:story_app_flutter/splash_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/authentication',
      name: 'authentication',
      builder: (context, state) {
        return const AuthenticationScreen();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
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
        GoRoute(
          path: 'add',
          name: 'add',
          builder: (context, state) {
            return const AddStoryScreen();
          },
          routes: [
            GoRoute(
              path: 'map_picker',
              name: 'map picker',
              builder: (context, state) {
                return const MapPickerScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'settings',
          name: 'settings',
          builder: (context, state) {
            return const SettingsScreen();
          },
        )
      ],
    ),
  ],
);
