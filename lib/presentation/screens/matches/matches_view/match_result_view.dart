import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/providers/provider.dart';

import '../../../../domain/entities/entities.dart';
import '../../../resourcing/color_manager.dart';
import '../matchs_widgets/team_widget.dart';
import 'preview_view.dart';
import 'tabel_view.dart';

class MatchResultView extends ConsumerStatefulWidget {
  const MatchResultView({Key? key, required this.fixtureId}) : super(key: key);
  final int fixtureId;
  final String img =
      'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MatchResultViewState();
}

class MatchResultViewState extends ConsumerState<MatchResultView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);

    super.initState();
  }

  //  actions: [
  List<Standing> standings = [];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final availableWidth = mediaQuery.size.width - 160;
    return ref.watch(matcheEventsFutureProvider(widget.fixtureId)).when(
          data: (data) {
            final match = data[0];

            return Scaffold(
                // floatingActionButton: FloatingActionButton(
                //   onPressed: () {
                //     log(data.length.toString());
                //   },
                // ),
                body: data.isEmpty
                    ? Center(
                        child: Text('No data'),
                      )
                    : NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverAppBar(
                              // title: Row(
                              //   children: [
                              //     Image.network(
                              //       img,
                              //       width: 25,
                              //     ),
                              //     Spacer(),
                              //     Text(
                              //       '2    FT    1',
                              //       style: TextStyle(color: Colors.white, fontSize: 20),
                              //     ),
                              //     Spacer(),
                              //     Image.network(
                              //       img,
                              //       width: 25,
                              //     ),
                              //   ],
                              // ),
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.star_outline_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert)),
                              ],
                              flexibleSpace: FlexibleSpaceBar(
                                background: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TeamNameWidget(
                                              image: match.teams.home.logo,
                                              name: match.teams.home.name),
                                          // const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${match.goals.home}'
                                                ' - '
                                                '${match.goals.away}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                match.fixture.status.long,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),

                                          TeamNameWidget(
                                              image: match.teams.away.logo,
                                              name: match.teams.away.name),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              bottom: TabBar(
                                controller: _controller,
                                tabs: [
                                  const Tab(
                                    text: 'Preview',
                                  ),
                                  const Tab(
                                    text: 'Lineup',
                                  ),
                                  const Tab(
                                    text: 'Table',
                                  ),
                                  const Tab(
                                    text: 'H2H',
                                  ),
                                ],
                              ),
                              expandedHeight: 240,
                              pinned: true,
                              backgroundColor:
                                  const Color.fromARGB(255, 32, 31, 31),
                            )
                          ];
                        },
                        body: TabBarView(
                          controller: _controller,
                          children: [
                            PreviewView(match: match),
                            TabelView(league: match.league),
                            TabelView(league: match.league),
                            PreviewView(match: match),
                          ],
                        )));
          },
          error: (error, stackTrace) {
            print(stackTrace.toString() + 'tracee');
            return Scaffold(
              body: Center(
                  child: Text(
                '$error',
                style: const TextStyle(color: Colors.white),
              )),
            );
          },
          loading: () => const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator())),
        );
  }
}

Container buildMatchStatstics(MatchEvent event) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: ColorManager.primary,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          const Text(
            'Average Possession',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 170,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: Colors.purple),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('  49%',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              const Spacer(),
              Container(
                height: 30,
                width: 190,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.blue),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text('51%  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics!.first.statistics!
                          .where((e) => e.type == 'Total Shots')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              const Text('Total Shots',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Spacer(),
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics![1].statistics!
                          .where((e) => e.type == 'Total Shots')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics![0].statistics!
                          .where((e) => e.type == 'Shots on Goal')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              const Text('Shots on Goal',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Spacer(),
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics![1].statistics!
                          .where((e) => e.type == 'Shots on Goal')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics![1].statistics!
                          .where((e) => e.type == 'Shots off Goal')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              const Text('Shots off Goal',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const Spacer(),
              Container(
                height: 25,
                width: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(232, 55, 51, 51),
                ),
                child: Center(
                  child: Text(
                      event.statistics![1].statistics!
                          .where((e) => e.type == 'Shots off Goal')
                          .first
                          .value
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Container buildMatchDetails(MatchEvent match) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: ColorManager.primary,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          buildDetail(
              Icons.calendar_month,
              DateTime.fromMillisecondsSinceEpoch(
                      match.fixture.timestamp * 1000)
                  .toString()),
          const SizedBox(
            height: 10,
          ),
          buildDetail(Icons.leaderboard,
              match.league.name + ' - ' + match.league.round!),
          const SizedBox(
            height: 10,
          ),
          buildDetail(Icons.stadium,
              match.fixture.venue.name + ', ' + match.fixture.venue.city),
          const SizedBox(
            height: 10,
          ),
          buildDetail(Icons.sports, match.fixture.referee),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Row buildDetail(IconData icon, String label) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        // width: 40,
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(232, 55, 51, 51),
        ),
        child: Center(
          child: Text(label,
              style: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      SizedBox(
        width: 20,
      ),
    ],
  );
}

Container buildMatchFacts(
  MatchEvent match,
) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: ColorManager.primary,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          // bool x = match.events![0].team.name == match.teams.home.name;
          switch (match.events![i].type) {
            case 'Goal':
              // match.events![i].team.name == match.teams.away.name
              //     ? awayGoals++
              //     : homeGoals++;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildGoalTile(
                  event: match.events![i],
                  isEnd: match.events![i].team.name == match.teams.away.name,
                ),
              );
            case 'Card':
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildYellowTile(
                    event: match.events![i],
                    isEnd: match.events![i].team.name == match.teams.away.name),
              );
            case 'subst':
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildChangingTile(
                    event: match.events![i],
                    isEnd: match.events![i].team.name == match.teams.away.name),
              );
          }
          return Text('');
        },
        itemCount: match.events!.length,
      ),
      // child: Column(
      //   children: [
      //     buildGoalTile(event: ),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildChangingTile(isEnd: true),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildGoalTile(isEnd: true),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildChangingTile(),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildChangingTile(),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildChangingTile(),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     buildYellowTile(),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //   ],
      // ),
    ),
  );
}

Row buildGoalTile({bool isEnd = false, required Event event, int goals = 0}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      Text(
        event.time.elapsed.toString(),
        style: TextStyle(color: ColorManager.white),
      ),
      const SizedBox(
        width: 10,
      ),
      const Icon(
        Icons.sports_soccer,
        color: ColorManager.white,
        size: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment:
            isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(text: '${event.player.name} (', children: [
              TextSpan(text: '1 ', style: TextStyle(color: Colors.green)),
              TextSpan(
                text: '- 0)',
              )
            ]),
            style: TextStyle(color: ColorManager.white),
          ),
          Text(
            event.assist.name.toString(),
            style: TextStyle(color: ColorManager.grey2),
          ),
        ],
      )
    ],
  );
}

Row buildYellowTile({bool isEnd = false, required Event event}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      Text(
        event.time.elapsed.toString(),
        style: TextStyle(color: ColorManager.white),
      ),
      const SizedBox(
        width: 10,
      ),
      Image.asset(
        event.detail == 'Yellow Card'
            ? 'assets/images/yellow_card.png'
            : 'assets/images/red_card.png',
        width: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        event.player.name,
        style: TextStyle(color: ColorManager.white),
      ),
    ],
  );
}

Row buildChangingTile({bool isEnd = false, required Event event}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      Text(
        event.time.elapsed.toString(),
        style: TextStyle(color: ColorManager.white),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment:
            isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text.rich(
            textDirection: isEnd ? TextDirection.ltr : TextDirection.rtl,
            style: const TextStyle(color: ColorManager.white),
            TextSpan(text: event.assist.name, children: [
              const TextSpan(text: '    '),
              WidgetSpan(
                  child: CircleAvatar(
                maxRadius: 8,
                backgroundColor: Colors.green,
                child: Icon(
                  isEnd ? Icons.arrow_back : Icons.arrow_forward,
                  size: 10,
                ),
              ))
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Text.rich(
            textDirection: isEnd ? TextDirection.ltr : TextDirection.rtl,
            style: const TextStyle(color: ColorManager.white),
            TextSpan(text: event.player.name, children: [
              const TextSpan(text: '    '),
              WidgetSpan(
                  child: CircleAvatar(
                maxRadius: 8,
                backgroundColor: Colors.red,
                child: Icon(
                  isEnd ? Icons.arrow_forward : Icons.arrow_back,
                  size: 10,
                ),
              ))
            ]),
          ),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}

Container buildManOfTheMatch(
    String img, String name, String rate, String team) {
  return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorManager.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Player of The match',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ), //Todo POF
            ListTile(
              leading: SizedBox(
                  height: 115,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(img),
                      ),
                      Positioned(
                          left: 20,
                          child: Container(
                              height: 20,
                              width: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text.rich(TextSpan(
                                    style: TextStyle(color: ColorManager.white),
                                    text: rate,
                                    children: const [
                                      WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 10,
                                          ))
                                    ])),
                              )))
                    ],
                  )),
              title: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: Text.rich(TextSpan(
                  style: const TextStyle(color: ColorManager.white),
                  children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        baseline: TextBaseline.ideographic,
                        child: Image.network(
                          img,
                          width: 20,
                        )),
                    TextSpan(text: team)
                  ])),
            )
          ],
        ),
      ));
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: progress,
            child: const ColoredBox(
              color: Color(0xBE7A81FF),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            color: const Color.fromARGB(255, 22, 22, 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: progress + 50,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png'),
                    ),
                    const Spacer(),
                    const Text(
                      '2 - 0',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(),
            actions: [
              IconButton(
                icon: const Icon(Icons.star_border_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            elevation: 0,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 240;

  @override
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
