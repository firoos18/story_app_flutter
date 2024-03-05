import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app_flutter/core/common/common.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/add_story/add_story_bloc.dart';
import 'package:story_app_flutter/features/add_story/presentation/bloc/pick_image/pick_image_bloc.dart';
import 'package:story_app_flutter/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:story_app_flutter/features/details/presentation/bloc/story_details_bloc.dart';
import 'package:story_app_flutter/features/stories/presentation/bloc/story_bloc.dart';
import 'package:story_app_flutter/injection_container.dart';
import 'package:story_app_flutter/core/route/route.dart';
import 'package:story_app_flutter/core/theme/color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (_) => injector()),
        BlocProvider<StoryBloc>(create: (_) => injector()),
        BlocProvider<StoryDetailsBloc>(create: (_) => injector()),
        BlocProvider<PickImageBloc>(create: (_) => injector()),
        BlocProvider<AddStoryBloc>(create: (_) => injector()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
