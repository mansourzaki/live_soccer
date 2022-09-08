import 'package:flutter/material.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 236, 235, 232),
      primaryColor: ColorManager.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          actionsIconTheme: IconThemeData(color: ColorManager.black)),
      listTileTheme:
          ListTileThemeData(textColor: Colors.black, iconColor: Colors.white),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.black,
      ),
      // textTheme: TextTheme(
      //   bodySmall: TextStyle(color: Colors.black),
      //   bodyMedium: TextStyle(color: Colors.black),
      //   bodyLarge: TextStyle(color: Colors.black),
      //   displayLarge: TextStyle(color: Colors.black),
      //   displayMedium: TextStyle(color: Colors.black),
      //   displaySmall: TextStyle(color: Colors.black),
      //   titleLarge: TextStyle(color: Colors.black),
      //   titleMedium: TextStyle(color: Colors.black),
      //   titleSmall: TextStyle(color: Colors.black),
      //   headlineLarge: TextStyle(color: Colors.black),
      //   headlineMedium: TextStyle(color: Colors.black),
      //   headlineSmall: TextStyle(color: Colors.black),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Color.fromARGB(221, 76, 74, 74))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.white,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.mixGreen,
          type: BottomNavigationBarType.fixed));

  static final darkTheme = ThemeData(
      primaryColor: ColorManager.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.primary,
          actionsIconTheme: IconThemeData(color: ColorManager.white)),
      scaffoldBackgroundColor: ColorManager.darkBackground,
      listTileTheme:
          ListTileThemeData(textColor: Colors.white, iconColor: Colors.white),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.darkBackground,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.mixGreen,
          type: BottomNavigationBarType.fixed));
}

ThemeData getApplicationTheme() {
  return ThemeData(
      primaryColor: ColorManager.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.primary,
          actionsIconTheme: IconThemeData(color: ColorManager.white)),
      scaffoldBackgroundColor: ColorManager.darkBackground,
      listTileTheme:
          ListTileThemeData(textColor: Colors.white, iconColor: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.darkBackground,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.mixGreen,
          type: BottomNavigationBarType.fixed));
}
