import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/presentation/helpers/sp.dart';

final appThemeStateNotifier =
    ChangeNotifierProvider<AppThemeState>((ref) => AppThemeState());

// final darkTheme = StateNotifierProvider<AppThemeState,bool>((ref) => );

// final sharedPrefs = FutureProvider<SpHelper>((_) async => SpHelper.spHelper);

// class AppThemeState extends StateNotifier<bool> {
//   AppThemeState() : super(false);

//   void setLightTheme() => state = false;
//   void setDarkTheme() => state = true;
// }

class AppThemeState extends ChangeNotifier {
  var isDarkModeEnabled = true;

  void setLightTheme() {
    isDarkModeEnabled = false;
    SpHelper.spHelper.saveTheme(isDarkModeEnabled);
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    SpHelper.spHelper.saveTheme(isDarkModeEnabled);
    notifyListeners();
  }
}
