// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'entities.dart';

class Standing extends Equatable {
  final int rank;
  final Team team;
  final int points;
  final int goalsDiff;
  final String group;
  final String form;
  final String status;
  final String description;
  final All all;
  const Standing({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.description,
    required this.all,
  });

  @override
  List<Object?> get props =>
      [rank, team, points, goalsDiff, group, form, status, description, all];
}

class All extends Equatable {
  final int played;
  final int win;
  final int draw;
  final int lose;
  final Goals goals;
  const All({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  @override
  List<Object?> get props => [played, win, draw, lose, goals];
}
