import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app/env/env.dart';
import 'package:weather_app/locator.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
    // Initialize Hydrated Bloc for Caching Theme Preference
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    // Set the preferred orientation to portrait up
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // Initialize locator
    Locator.setupLocator(baseUrl: Env.baseUrl);
    // Initialize Easy Localization
    await EasyLocalization.ensureInitialized();
  }
}
