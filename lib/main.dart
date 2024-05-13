import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:leychenko_pixabay_test_app/services/i18n/app_localization_delegate.dart';
import 'services/envelopments/environment_config.dart';
import 'go_router/router.dart';
import 'services/api/api.dart';
import 'services/i18n/bloc/locatization_cubit.dart';
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
  GetIt.instance.registerSingleton<LocatizationCubit>(LocatizationCubit());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocatizationCubit, LocatizationState>(
      bloc: loclCubit,
      buildWhen: loclCubit.buildWhenMain,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'PIXABAY IMAGES',
          theme: appTheme,
          routerConfig: goRouter,
          locale: state.locale,
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeListResolutionCallback: (locales, supportedLocales) {
            return state.locale;
          },
          supportedLocales: EnvironmentConfig.supportedLocales.map((e) => Locale(e,'')).toList()
        );
      },
    );
  }
}
