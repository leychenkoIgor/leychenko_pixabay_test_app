import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'go_router/router.dart';
import 'services/api/api.dart';
import 'services/theme/theme.dart';
import 'package:pixabay_api/pixabay_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppTheme();
  initGoRouter();
  await dotenv.load(fileName: "assets/.env");
  if (dotenv.env['API_URL'] != null &&
      dotenv.env['API_URL']!.isNotEmpty &&
      dotenv.env['KEY'] != null &&
      dotenv.env['KEY']!.isNotEmpty) {
    GetIt.instance.registerSingleton<PixabayAPI>(
        PixabayAPI(dotenv.env['API_URL']!, dotenv.env['KEY']!));
  } else {
    exit(404);
  }
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
