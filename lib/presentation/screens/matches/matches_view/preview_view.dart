import 'package:flutter/material.dart';
import 'package:live_soccer/domain/entities/fixtures.dart';
import 'match_result_view.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({Key? key, required this.match}) : super(key: key);
  final MatchEvent match;
  final String img =
      'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          children: [
            // Container(
            //   height: 400,
            // ),
           // buildManOfTheMatch(match.lineups.first.startXI.first.player.,),
            SizedBox(
              height: 10,
            ),
            buildMatchFacts(match),
            SizedBox(
              height: 10,
            ),
            buildMatchStatstics(match),
            SizedBox(
              height: 10,
            ),
            buildMatchDetails(match)
          ],
        ),
      ),
    );
  }
}
