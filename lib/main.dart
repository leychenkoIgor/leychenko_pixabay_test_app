import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'services/envelopments/environment_config.dart';
import 'go_router/router.dart';
import 'services/api/api.dart';
import 'services/theme/theme.dart';
import 'package:pixabay_api/pixabay_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // GetIt.instance.registerSingleton<EnvironmentConfig>(EnvironmentConfig);
  initAppTheme();
  initGoRouter();

  GetIt.instance.registerSingleton<PixabayAPI>(
      PixabayAPI(EnvironmentConfig.apiUrl, EnvironmentConfig.apiKey));

  GetIt.instance.registerSingleton<ApiPhotos>(ApiPhotos());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: goRouter,
    );
  }
}
