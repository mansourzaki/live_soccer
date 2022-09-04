import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/screens/matches_view/matches_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final List<Widget> pages = [MatchesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MatchesScreen(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer), label: 'Matches'),
        BottomNavigationBarItem(icon: Icon(Icons.military_tech), label: 'News'),
        BottomNavigationBarItem(
            icon: Icon(Icons.military_tech), label: 'Leagues'),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined), label: 'Following'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ]),
      
    );
  }
}
