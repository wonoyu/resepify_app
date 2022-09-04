import 'package:flutter/material.dart';
import 'package:resepify_app/src/shared/constants/colors.dart';

final appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final base = ThemeData.light();
  return base.copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: white,
        color: white,
        elevation: 0.0,
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: white,
          indicatorColor: white,
          iconTheme: MaterialStateProperty.all(const IconThemeData(
            color: black,
          )),
          labelTextStyle:
              MaterialStateProperty.all(const TextStyle(fontSize: 0.0)),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorShape: const CircleBorder()),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0))))));
}
