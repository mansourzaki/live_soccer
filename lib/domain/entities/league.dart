// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:live_soccer/domain/entities/entities.dart';

import 'country.dart';

class Leagues {
  League? league;
  Country? country;
  Leagues({this.country, this.league});
}
// class League {
//   int id;
//   String name;
//   String? type;
//   String? country;
//   String logo;
//   String? flag;
//   int? season;
//   String? round;
//   List<Stading>? stadings;

//   League(
//       {required this.id,
//       required this.name,
//       this.country,
//       this.type,
//       required this.logo,
//       this.flag,
//       this.season,
//       this.round,
//       this.stadings});
// }

class League {
  int id;
  String name;
  String type;
  String logo;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });
}

class Stading {
  int rank;
  int points;
  int goalsDiff;
  String group;
  Stading({
    required this.rank,
    required this.points,
    required this.goalsDiff,
    required this.group,
  });
}

class AllStats {
  int playes;
  int win;
  int draw;
  int lose;
  Goals goals;
  AllStats({
    required this.playes,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });
}

class HomeStats {
  int playes;
  int win;
  int draw;
  int lose;
  Goals goals;
  HomeStats({
    required this.playes,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });
}

class AwayStats {
  int playes;
  int win;
  int draw;
  int lose;
  Goals goals;
  AwayStats({
    required this.playes,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });
}
