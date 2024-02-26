import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/initializer/app_initializer.dart';
import 'package:weather_app/app/l10n/app_l10n.dart';
import 'package:weather_app/app/theme/cubit/theme_cubit.dart';
import 'package:weather_app/app/theme/dark/app_dark_theme.dart';
import 'package:weather_app/app/theme/light/app_light_theme.dart';
import 'package:weather_app/features/home/presentation/view/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(
    EasyLocalization(
      path: AppL10n.path,
      supportedLocales: AppL10n.supportedLocales,
      fallbackLocale: AppL10n.en,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // Theme
              theme: AppLightTheme().themeData,
              darkTheme: AppDarkTheme().themeData,
              themeMode: themeState.themeMode,
              // Localization
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home: child,
            );
          },
        ),
      ),
      child: const HomeViewLocationBuilder(),
    );
  }
}
