import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isLogin = true;
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go('/home');
        }

        if (state is AuthenticationFailed) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }

        if (state is RegisterSuccess) {
          setState(() {
            isLogin = true;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 175),
                    width: double.infinity,
                    height: isLogin ? 450 : 550,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isLogin
                                ? AppLocalizations.of(context)!.loginTitle
                                : AppLocalizations.of(context)!.registerTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 48,
                            ),
                          ),
                          Text(
                            isLogin
                                ? AppLocalizations.of(context)!.loginDescription
                                : AppLocalizations.of(context)!
                                    .registerDescription,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: const Icon(Ionicons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return AppLocalizations.of(context)!
                                    .emptyFieldAlert;
                              } else if (!value.contains("@")) {
                                return AppLocalizations.of(context)!
                                    .validEmailAlert;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          if (!isLogin)
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: "Username",
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: const Icon(Ionicons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .emptyFieldAlert;
                                }
                                return null;
                              },
                            ),
                          if (!isLogin) const SizedBox(height: 8),
                          TextFormField(
                            controller: passwordController,
                            obscureText: showPassword,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: const Icon(Ionicons.lock_closed),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: showPassword
                                    ? const Icon(Ionicons.eye)
                                    : const Icon(Ionicons.eye_off),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            validator: (value) {
                              if (value == null) {
                                return AppLocalizations.of(context)!
                                    .emptyFieldAlert;
                              } else if (value.length == 8 && !isLogin) {
                                return AppLocalizations.of(context)!
                                    .passwordLengthAlert;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (isLogin) {
                                  final String email =
                                      emailController.text.trim();
                                  final String password =
                                      passwordController.text.trim();

                                  context.read<AuthenticationBloc>().add(
                                        LoginButtonTapped(
                                          loginModel: LoginModel(
                                              email: email, password: password),
                                        ),
                                      );
                                } else if (!isLogin) {
                                  final String email =
                                      emailController.text.trim();
                                  final String password =
                                      passwordController.text.trim();
                                  final String username =
                                      usernameController.text.trim();

                                  context.read<AuthenticationBloc>().add(
                                        RegisterButtonTapped(
                                          registerModel: RegisterModel(
                                              email: email,
                                              name: username,
                                              password: password),
                                        ),
                                      );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
                              builder: (context, state) {
                                if (state is AuthenticationLoading) {
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                }

                                return Text(
                                  isLogin
                                      ? AppLocalizations.of(context)!
                                          .loginButton
                                      : AppLocalizations.of(context)!
                                          .registerButton,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isLogin
                                    ? AppLocalizations.of(context)!
                                        .registerInvitation
                                    : AppLocalizations.of(context)!
                                        .loginInvitation,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLogin = !isLogin;
                                  });
                                  emailController.clear();
                                  usernameController.clear();
                                  passwordController.clear();
                                },
                                child: Text(
                                  isLogin
                                      ? AppLocalizations.of(context)!
                                          .registerTextButton
                                      : AppLocalizations.of(context)!
                                          .loginTextButton,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
