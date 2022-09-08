import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferences;
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveTheme(bool isDark) async {
    await sharedPreferences!.setBool('isDark', isDark);
  }

  bool? getTheme() {
    return sharedPreferences!.getBool('isDark');
  }
}
