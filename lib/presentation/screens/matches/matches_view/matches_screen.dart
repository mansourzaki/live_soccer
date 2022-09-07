import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/domain/entities/fixtures.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/providers/provider.dart';

import '../../../resourcing/color_manager.dart';
import '../matchs_widgets/league_matches_widget.dart';

class MatchesScreen extends ConsumerStatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MatchesScreenState();
}

class MatchesScreenState extends ConsumerState<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    ref.read(matchesProvider.notifier).fetchMatches({'live': 'all'});
    initCountriesModule();
    super.initState();
  }

  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    List<FootballMatch> matches = ref.watch(matchesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('My League'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ref
          .watch(matchesFutureProvider(
              const {'season': 2022, 'date': '2022-09-06'}))
          .when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: MatchesAnimatedContainer(
                        footballMatches: data
                            .where(
                                (element) => element.league.country == 'spain')
                            .toList(),
                        league: data[0].league,
                        following: true),
                  ),
                  SizedBox(
                      height: 50,
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            isHidden = !isHidden;
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 36, 36, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                isHidden ? 'Show All' : 'Hide All',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              Icon(
                                !isHidden
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: ColorManager.grey2,
                              )
                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  isHidden
                      ? SizedBox()
                      : LeagueMatchesWidget(
                          matchesList: data,
                          leaguesList:
                              data.map((e) => e.league).toSet().toList(),
                        ),
                ]),
              );
            },
            error: (error, stackTrace) => Center(child: Text('$error')),
            loading: () => Center(child: Text('Error')),
          ),
    );
  }
}
