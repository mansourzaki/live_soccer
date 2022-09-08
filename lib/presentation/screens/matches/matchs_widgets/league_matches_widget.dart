import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as img;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:live_soccer/app/constants.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

import '../matches_view/match_result_view.dart';

class LeagueMatchesWidget extends StatefulWidget {
  List<FootballMatch> matchesList;
  List<League> leaguesList;
  LeagueMatchesWidget(
      {Key? key, required this.matchesList, required this.leaguesList})
      : super(key: key);

  @override
  State<LeagueMatchesWidget> createState() => _LeagueMatchesWidgetState();
}

class _LeagueMatchesWidgetState extends State<LeagueMatchesWidget> {
  bool isExpanded = false;
  // late AnimationController controller;
  // late Animation animation;

  @override
  void initState() {
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      primary: false,
      itemCount: widget.leaguesList.length,
      itemBuilder: (context, i) => MatchesAnimatedContainer(
        footballMatches: widget.matchesList
            .where((element) => element.league.id == widget.leaguesList[i].id)
            .toList(),
        league: widget.leaguesList[i],
        following: false,
      ),
    );
  }
}

class LeagueHeader extends StatefulWidget {
  const LeagueHeader(
      {Key? key,
      required this.league,
      required this.callBack,
      required this.liveMatches,
      required this.following,
      required this.numOfMatches})
      : super(key: key);
  final League league;
  final int liveMatches;
  final int numOfMatches;
  final bool following;
  final Function() callBack;

  @override
  State<LeagueHeader> createState() => _LeagueHeaderState();
}

class _LeagueHeaderState extends State<LeagueHeader> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.following
            ? Icon(Icons.star)
            : CircleAvatar(
                radius: 10,
                backgroundImage: img.Svg(
                    widget.league.flag ?? Constants.worldLogo,
                    source: img.SvgSource.network,
                    scale: 15,
                    size: Size(25, 20)),
              ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 8,
          child: Text(
            widget.following
                ? 'Following'
                : '${widget.league.country} - ${widget.league.name}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        isExpanded
            ? const SizedBox()
            : widget.liveMatches == 0
                ? CircleAvatar(
                    backgroundColor: Color.fromARGB(195, 35, 34, 34),
                    radius: 12,
                    child: Text(
                      widget.numOfMatches.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                : LiveMatchesNumWidget(),
        IconButton(
            splashRadius: 0.1,
            icon: Icon(
              !isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: ColorManager.grey2,
            ),
            onPressed: () {
              isExpanded = !isExpanded;
              widget.callBack();
            }),
      ],
    );
  }

  Container LiveMatchesNumWidget() {
    return Container(
      width: 40,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          '${widget.liveMatches}/${widget.numOfMatches}',
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}

class FixtureWidget extends ConsumerWidget {
  final FootballMatch footballMatch;

  const FixtureWidget({Key? key, required this.footballMatch})
      : super(key: key);
  String getTime() {
    final time =
        DateTime.fromMicrosecondsSinceEpoch(footballMatch.fixture.timestamp);
    return intl.DateFormat('h:mm a').format(time);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
      child: InkWell(
        onTap: () {
          log(footballMatch.fixture.id.toString());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MatchResultView(fixtureId: footballMatch.fixture.id),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            [
              '1H',
              'ET',
              'HT',
              '2H',
              'P'
            ].any((element) => element == footballMatch.fixture.status.short)
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 27, 94, 30),
                    child: Text(
                      footballMatch.fixture.status.elapsed.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                // : SizedBox(),
                : CircleAvatar(
                    radius: 13,
                    backgroundColor: Color.fromARGB(241, 26, 26, 26),
                    child: Text(
                      footballMatch.fixture.status.short,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(206, 67, 66, 66)),
                    ),
                  ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                footballMatch.teams.home.name,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Image.network(
              footballMatch.teams.home.logo,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                footballMatch.fixture.status.short == 'NS'
                    ? getTime()
                    : '${footballMatch.goals.home} - ${footballMatch.goals.away}',
                style: TextStyle(
                    color: footballMatch.fixture.status.short != 'NS'
                        ? Colors.white
                        : Color.fromARGB(255, 100, 99, 99),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Image.network(
              footballMatch.teams.away.logo,
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                footballMatch.teams.away.name,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchesAnimatedContainer extends StatefulWidget {
  const MatchesAnimatedContainer(
      {Key? key,
      required this.footballMatches,
      required this.league,
      required this.following})
      : super(key: key);
  final List<FootballMatch> footballMatches;
  final League league;
  final bool following;

  @override
  State<MatchesAnimatedContainer> createState() =>
      _MatchesAnimatedContainerState();
}

class _MatchesAnimatedContainerState extends State<MatchesAnimatedContainer> {
  bool isExpanded = false;
  void callBackFunction() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  int getNumOflive() {
    return widget.footballMatches
        .where((element) => ['1H', 'ET', 'HT', '2H', 'P']
            .any((e) => e == element.fixture.status.short))
        .toList()
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Column(
        children: [
          AnimatedContainer(
            constraints: BoxConstraints(maxHeight: 45),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            decoration: BoxDecoration(
              borderRadius: !isExpanded
                  ? BorderRadius.circular(10)
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
              color: const Color.fromARGB(255, 27, 26, 26),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: LeagueHeader(
                  league: widget.league,
                  callBack: callBackFunction,
                  liveMatches: getNumOflive(),
                  following: widget.following,
                  numOfMatches: widget.footballMatches.length),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          AnimatedCrossFade(
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstCurve: Curves.ease,
            duration: const Duration(milliseconds: 200),
            secondChild: const SizedBox(),
            firstChild: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: ColorManager.primary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      for (FootballMatch match in widget.footballMatches)
                        FixtureWidget(
                          footballMatch: match,
                        )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(int i) {
    return TableRow(children: [
      widget.footballMatches[i].fixture.status.short == 'NS'
          ? SizedBox()
          : SizedBox(),
      // : CircleAvatar(
      //     radius: 13,
      //     backgroundColor: ColorManager.grey2,
      //     child: Text(
      //       widget.footballMatches[i].fixture.status.short,
      //       style: const TextStyle(
      //           fontSize: 10,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.black45),
      //     ),
      //   ),
      // Text(
      //   widget.footballMatches[i].teams.home.name,
      //   textDirection: TextDirection.rtl,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 12,
      //   ),
      // ),
      // Image.network(
      //   widget.footballMatches[i].teams.home.logo,
      //   width: 30,
      //   height: 30,
      // ),
      Text.rich(
        TextSpan(children: [
          TextSpan(
            text: widget.footballMatches[0].teams.home.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Image.network(
              widget.footballMatches[0].teams.home.logo,
              width: 40,
              height: 30,
            ),
          ),
        ]),
      ),
      Text(
        widget.footballMatches[i].fixture.status.short == 'NS'
            ? '2:27 AM'
            : '${widget.footballMatches[i].goals.home} - ${widget.footballMatches[0].goals.home}',
        style: const TextStyle(
            color: Color.fromARGB(255, 100, 99, 99),
            fontSize: 15,
            fontWeight: FontWeight.w600),
      ),
      Text.rich(TextSpan(children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.network(
            widget.footballMatches[0].teams.away.logo,
            width: 30,
            height: 30,
          ),
        ),
        TextSpan(
          text: widget.footballMatches[0].teams.away.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ])),
      // Image.network(
      //   widget.footballMatches[0].teams.away.logo,
      //   width: 10,
      //   height: 30,
      // ),
      // Text(
      //   widget.footballMatches[0].teams.away.name,
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 12,
      //   ),
      // ),
    ]);
  }
}
