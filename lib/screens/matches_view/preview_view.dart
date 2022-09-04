import 'package:flutter/material.dart';
import 'match_result_view.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({Key? key}) : super(key: key);
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
            buildManOfTheMatch(img),
            SizedBox(
              height: 10,
            ),
            buildMatchFacts(),
            SizedBox(
              height: 10,
            ),
            buildMatchStatstics()
          ],
        ),
      ),
    );
  }
}
