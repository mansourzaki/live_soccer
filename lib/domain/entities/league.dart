// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:live_soccer/domain/entities/entities.dart';

class Competion extends Equatable {
  final League league;
  final Country country;
  const Competion({required this.country, required this.league});

  @override
  List<Object?> get props => [league, country];
}

class League extends Equatable {
  final int id;
  final String name;
  final String type;
  final String logo;
  final String? country;
  final String? flag;
  final int? season;
  final String? round;
  final List<Standing>? standings;

  const League(
      {required this.id,
      required this.name,
      required this.type,
      required this.logo,
      this.country,
      this.flag,
      this.season,
      this.round,
      this.standings
      });

  @override
  List<Object?> get props => [id, name, type, logo];
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
