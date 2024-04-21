import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppColors {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  final Color appBarIconButtonBackgroundColor = colorFromHex("F5F4F8");
  final Color cardColor = colorFromHex("F5F4F8");
}

class AppTextStyles {
  const AppTextStyles();

  TextStyle get uI30Semi => const TextStyle(
        fontSize: 30,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 30 / 30,
        letterSpacing: 0,
      );
}

void initAppTheme() {
  GetIt.instance.registerSingleton<ThemeData>(ThemeData(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.withOpacity(0.6),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30))));
  GetIt.instance.registerSingleton<AppColors>(AppColors());
  GetIt.instance.registerSingleton<AppTextStyles>(const AppTextStyles());
}

ThemeData get appTheme => GetIt.I<ThemeData>();

AppColors get appColors => GetIt.I<AppColors>();

AppTextStyles get appTextStyles => GetIt.I<AppTextStyles>();
