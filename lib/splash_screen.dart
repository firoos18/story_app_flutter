import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthenticationBloc>().add(ApplicationOpened());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Future.delayed(const Duration(seconds: 2));
          context.go('/home');
        }

        if (state is AuthenticationInitial) {
          Future.delayed(const Duration(seconds: 2));
          context.go('/authentication');
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: FlutterLogo(
              style: FlutterLogoStyle.markOnly,
              size: 200,
            ),
          ),
        );
      },
    );
  }
}
