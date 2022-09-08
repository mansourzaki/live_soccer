import 'dart:async';
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
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart' as intl;
import '../../../resourcing/color_manager.dart';
import '../matchs_widgets/league_matches_widget.dart';

class MatchesScreen extends ConsumerStatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MatchesScreenState();
}

class MatchesScreenState extends ConsumerState<MatchesScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Timer? timer;

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    ref
        .read(matchesProvider.notifier)
        .fetchMatches({'season': 2022, 'date': '2022-09-08'});
    log('in init');
    // timer = Timer.periodic(
    //     Duration(seconds: 60), (Timer t) =>  ref.read(matchesProvider.notifier).updateLive());
    initCountriesModule();
    super.initState();
  }

  bool isHidden = false;

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<FootballMatch> matches = ref.watch(matchesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
          actions: [
            IconButton(
                onPressed: () {
                  ref
                      .read(matchesProvider.notifier)
                      .fetchMatches({'live': 'all'});
                  log('presse');
                },
                icon: Icon(Icons.schedule)),
            IconButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2040));
                  if (picked != null) {
                    ref.read(matchesProvider.notifier).fetchMatches({
                      'season': picked.year,
                      'date': '${picked.year}-0${picked.month}-0${picked.day}'
                    });
                  }
                },
                icon: Icon(Icons.calendar_today)),
            //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   ref
        //       .read(matchesProvider.notifier)
        //       .fetchMatches({'season': 2022, 'date': '2022-09-07'});
        // }),
        body: matches.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        intl.DateFormat('yyyy-MM-dd').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                matches[0].fixture.timestamp * 1000)),
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: MatchesAnimatedContainer(
                        footballMatches: matches
                            .where((element) => element.league.id == 2)
                            .toList(),
                        league: matches[0].league,
                        following: true),
                  ),
                  SizedBox(
                      height: 52,
                      width: 112,
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
                          matchesList: matches,
                          leaguesList:
                              matches.map((e) => e.league).toSet().toList(),
                        ),
                ]),
              )

        // ref
        //     .watch(matchesFutureProvider(
        //         const {'season': 2022, 'date': '2022-09-06'}))
        //     .when(
        //       data: (data) {

        //       },

        //     ),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
// 