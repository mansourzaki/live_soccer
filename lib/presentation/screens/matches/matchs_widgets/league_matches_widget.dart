import 'dart:developer';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:live_soccer/app/constants.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/domain/entities/fixtures.dart';
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
      physics: const BouncingScrollPhysics(),
      primary: false,
      itemCount: widget.leaguesList.length,
      itemBuilder: (context, i) => MatchesAnimatedContainer(
        footballMatches: widget.matchesList
            .where((element) => element.league.id == widget.leaguesList[i].id)
            .toList(),
        league: widget.leaguesList[i],
      ),
    );
  }
}

class LeagueHeader extends StatefulWidget {
  const LeagueHeader(
      {Key? key,
      required this.league,
      required this.callBack,
      required this.numOfMatches})
      : super(key: key);
  final League league;
  final int numOfMatches;
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
        CircleAvatar(
          radius: 10,
          backgroundImage: img.Svg(widget.league.flag ?? Constants.worldLogo,
              source: img.SvgSource.network, scale: 15, size: Size(25, 20)),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 8,
          child: Text(
            '${widget.league.country} - ${widget.league.name}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        isExpanded
            ? const SizedBox()
            : CircleAvatar(
                backgroundColor: Color.fromARGB(195, 35, 34, 34),
                radius: 12,
                child: Text(
                  widget.numOfMatches.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
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
}

class FixtureWidget extends StatelessWidget {
  final FootballMatch footballMatch;
  const FixtureWidget({Key? key, required this.footballMatch})
      : super(key: key);
  String getTime() {
    final time =
        DateTime.fromMicrosecondsSinceEpoch(footballMatch.fixture.timestamp);
    return DateFormat('h:mm a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MatchResultView(),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            footballMatch.fixture.status.short == 'NS'
                ? SizedBox()
                : CircleAvatar(
                    radius: 13,
                    backgroundColor: ColorManager.grey2,
                    child: Text(
                      footballMatch.fixture.status.short,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
            Text(
              footballMatch.teams.home.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Image.network(
              footballMatch.teams.home.logo,
              width: 30,
              height: 30,
            ),
            Text(
              footballMatch.fixture.status.short == 'NS'
                  ? getTime()
                  : '${footballMatch.goals.home} - ${footballMatch.goals.home}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 100, 99, 99),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Image.network(
              footballMatch.teams.away.logo,
              width: 30,
              height: 30,
            ),
            Text(
              footballMatch.teams.away.name,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
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
      {Key? key, required this.footballMatches, required this.league})
      : super(key: key);
  final List<FootballMatch> footballMatches;
  final League league;

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
              child: Column(
                children: [
                  for (FootballMatch match in widget.footballMatches)
                    FixtureWidget(footballMatch: match)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
