import 'package:flutter/material.dart';

import '../../../resourcing/color_manager.dart';
import '../matchs_widgets/team_widget.dart';
import 'preview_view.dart';
import 'tabel_view.dart';

class MatchResultView extends StatefulWidget {
  const MatchResultView({Key? key}) : super(key: key);
  final String img =
      'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png';
  @override
  State<MatchResultView> createState() => _MatchResultViewState();
}

class _MatchResultViewState extends State<MatchResultView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  //  actions: [
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final availableWidth = mediaQuery.size.width - 160;
    return Scaffold(
        body: NestedScrollView(
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
                        icon: const Icon(Icons.star_outline_outlined)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              TeamNameWidget(
                                  image: widget.img, name: 'Manchester'),
                              const Spacer(),
                              const Text(
                                '2 - 0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              const Spacer(),
                              TeamNameWidget(
                                  image: widget.img, name: 'Manchester'),
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
                  backgroundColor: const Color.fromARGB(255, 32, 31, 31),
                )
              ];
            },
            body: TabBarView(
              controller: _controller,
              children: const [
                PreviewView(),
                TabelView(),
                TabelView(),
                PreviewView(),
              ],
            )));
  }
}

Container buildMatchStatstics() {
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
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
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
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
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
                child: const Center(
                  child: Text('1.17',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              const Text('Expected goals (xG)',
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
                child: const Center(
                  child: Text('0.48',
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
                child: const Center(
                  child: Text('17',
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
                child: const Center(
                  child: Text('5',
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
                child: const Center(
                  child: Text('5',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              const Text('Shots on target',
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
                child: const Center(
                  child: Text('1',
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

Container buildMatchFacts() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: ColorManager.primary,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          buildGoalTile(),
          const SizedBox(
            height: 15,
          ),
          buildChangingTile(isEnd: true),
          const SizedBox(
            height: 15,
          ),
          buildGoalTile(isEnd: true),
          const SizedBox(
            height: 15,
          ),
          buildChangingTile(),
          const SizedBox(
            height: 15,
          ),
          buildChangingTile(),
          const SizedBox(
            height: 15,
          ),
          buildChangingTile(),
          const SizedBox(
            height: 15,
          ),
          buildYellowTile(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}

Row buildGoalTile({bool isEnd = false}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      const Text(
        '7',
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
        children: const [
          Text.rich(
            TextSpan(text: 'Cristiano Ronaldo (', children: [
              TextSpan(text: '1 ', style: TextStyle(color: Colors.green)),
              TextSpan(
                text: ' - 0)',
              )
            ]),
            style: TextStyle(color: ColorManager.white),
          ),
          Text(
            'Assist by Diaz',
            style: TextStyle(color: ColorManager.grey2),
          ),
        ],
      )
    ],
  );
}

Row buildYellowTile({bool isEnd = false}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      const Text(
        '88',
        style: TextStyle(color: ColorManager.white),
      ),
      const SizedBox(
        width: 10,
      ),
      Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Yellow_card.svg/1574px-Yellow_card.svg.png',
        width: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      const Text(
        'Cristiano Ronaldo',
        style: TextStyle(color: ColorManager.white),
      ),
    ],
  );
}

Row buildChangingTile({bool isEnd = false}) {
  return Row(
    textDirection: isEnd ? TextDirection.rtl : null,
    children: [
      const Text(
        '58',
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
            TextSpan(text: 'Casemero', children: [
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
            TextSpan(text: 'Varane', children: [
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

Container buildManOfTheMatch(String img) {
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
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://cdn.resfu.com/img_data/players/big/776260.jpg'),
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
                              child: const Center(
                                child: Text.rich(TextSpan(
                                    style: TextStyle(color: ColorManager.white),
                                    text: '8.4',
                                    children: [
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
              title: const Text(
                'Ansu Fati',
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
                    const TextSpan(text: '  Manchester United')
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
