import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                child: Icon(
              Icons.dark_mode,
            )),
            title: Text('Theme'),
            subtitle: Text(appThemeState.isDarkModeEnabled ? 'Dark' : 'Light'),
            trailing: Switch(
              value: appThemeState.isDarkModeEnabled,
              onChanged: (v) {
                v
                    ? appThemeState.setDarkTheme()
                    : appThemeState.setLightTheme();
              },
              inactiveTrackColor: ColorManager.grey,
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.language,
              ),
            ),
            title: Text('Language'),
            subtitle: Text('English Us'),
            trailing: Switch(
                value: false,
                onChanged: (v) {},
                activeColor: Colors.blue,
                inactiveTrackColor: ColorManager.grey),
          )
        ],
      )),
    );
  }
}
