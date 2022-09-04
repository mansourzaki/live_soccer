import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';
import 'package:live_soccer/screens/matches_view/match_result_view.dart';

class LeagueMatchesWidget extends StatefulWidget {
  List<Country> countriesList;
  LeagueMatchesWidget({Key? key, required this.countriesList})
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 27, 26, 26),
      ),
      child: ListView.builder(
        primary: false,
        itemCount: widget.countriesList.length,
        itemBuilder: (context, i) =>
            _buildCountryAnimatedContainer(widget.countriesList[i]),
      ),
    );
  }

  Container _buildCountryAnimatedContainer(Country country) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            decoration: BoxDecoration(
              borderRadius: !isExpanded
                  ? BorderRadius.circular(10)
                  : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
              color: Color.fromARGB(255, 27, 26, 26),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: _buildLeagueHeadder(country),
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
            duration: Duration(milliseconds: 200),
            secondChild: SizedBox(),
            firstChild: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: ColorManager.primary,
              ),
              child: Column(
                children: [
                  _buildMatchResult(),
                  _buildMatchResult(),
                  _buildMatchResult(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildLeagueHeadder(Country country) {
    return Row(
      children: [
        SvgPicture.network(
          country.flag,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          country.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        isExpanded
            ? const SizedBox()
            : const CircleAvatar(
                backgroundColor: ColorManager.grey,
                radius: 10,
                child: Text(
                  '3',
                  style: TextStyle(fontSize: 14, color: Colors.white),
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
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildMatchResult() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MatchResultView(),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircleAvatar(
              radius: 13,
              backgroundColor: ColorManager.grey2,
              child: Text(
                'FT',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ),
            Text(
              'Team Name',
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Icon(Icons.abc),
            Text(
              '0 - 1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            Icon(Icons.face),
            Text(
              'Team Name',
              overflow: TextOverflow.visible,
              style: TextStyle(
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
