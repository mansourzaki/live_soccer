import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/presentation/providers/navigation_provider.dart';
import 'package:live_soccer/presentation/screens/following_screen.dart';

import 'package:live_soccer/presentation/screens/leagues_screens/leagues_screen.dart';
import 'package:live_soccer/presentation/screens/news_screen.dart';
import 'package:live_soccer/presentation/screens/settings_screen.dart';

import 'matches/matches_view/matches_screen.dart';

class MainPage extends ConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const MatchesScreen(),
    LeaguesScreen(),
    FollowingScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageModel navigation = ref.watch(navigationProvider);
    return Scaffold(
      body: PageView(
        children: [pages[navigation.index]],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            ref.read(navigationProvider.notifier).selectPage(i);
          },
          currentIndex: navigation.index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer), label: 'Matches'),
            BottomNavigationBarItem(
                icon: Icon(Icons.military_tech), label: 'Leagues'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined), label: 'Following'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
