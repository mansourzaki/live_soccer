import 'package:flutter/material.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primaryColor: ColorManager.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.primary,
          actionsIconTheme: IconThemeData(color: ColorManager.white)),
      scaffoldBackgroundColor: ColorManager.darkBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.darkBackground,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.mixGreen,
          type: BottomNavigationBarType.fixed));
}
