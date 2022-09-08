import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/domain/entities/standings_entiteis.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

import '../../../../data/network/requests.dart';
import '../../../../domain/entities/entities.dart';
import '../../../../providers/provider.dart';

class TabelView extends ConsumerWidget {
  const TabelView({Key? key, required this.league}) : super(key: key);
  final League league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(standingsProvider(StandingsRequest(season: 2022, league: league.id)))
        .when(
          data: (standingsd) {
            final List<Standing> standings = standingsd;
            log(standings.length.toString());
            return DataTable(
                dataRowColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.focused)) {
                      return Colors.yellow;
                    } else {
                      return null;
                    }
                  },
                ),
                columnSpacing: 10,
                dataTextStyle: const TextStyle(
                    color: Colors.white, overflow: TextOverflow.ellipsis),
                headingTextStyle: TextStyle(color: ColorManager.grey2),
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Team')),
                  DataColumn(label: Text('PL')),
                  DataColumn(label: Text('W')),
                  DataColumn(label: Text('D')),
                  DataColumn(label: Text('L')),
                  DataColumn(label: Text('+/-')),
                  DataColumn(label: Text('GD')),
                  DataColumn(label: Text('PTS')),
                ],
                rows: List.generate(standings.length, (i) {
                  return DataRow(color: null, cells: [
                    DataCell(Text(standings[i].rank.toString())),
                    DataCell(Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Image.network(
                            standings[i].team.logo,
                            width: 16,
                          )),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SizedBox(
                            width: 2,
                          )),
                      TextSpan(text: standings[i].team.name),
                    ]))),
                    DataCell(Text(standings[i].all.played.toString())),
                    DataCell(Text(standings[i].all.win.toString())),
                    DataCell(Text(standings[i].all.draw.toString())),
                    DataCell(Text(standings[i].all.lose.toString())),
                    DataCell(Text(standings[i].all.goals.home.toString() +
                        '-' +
                        standings[i].all.goals.away.toString())),
                    DataCell(Text((standings[i].goalsDiff.toString()))),
                    DataCell(Text(standings[i].points.toString())),
                  ]);
                }));
          },
          error: (error, stackTrace) {
            print(stackTrace);
            return Text('loading');
          },
          loading: () => Text('loading'),
        );
  }
}
