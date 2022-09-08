// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'entities.dart';

class FootballMatch extends Equatable {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;
  // final Score score;

  const FootballMatch({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    // required this.score
  });

  @override
  List<Object?> get props => [fixture, league, teams, goals];
}

class Fixture extends Equatable {
  int id;
  String referee;
  String timezone;
  String date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  Fixture(
      {required this.id,
      required this.referee,
      required this.timezone,
      required this.date,
      required this.timestamp,
      required this.periods,
      required this.venue,
      required this.status});

  @override
  List<Object?> get props =>
      [id, referee, timezone, date, timestamp, periods, venue];
}

class Status {
  String long;
  String short;
  int elapsed;

  Status({required this.long, required this.short, required this.elapsed});
}

class Periods extends Equatable {
  final int first;
  final int second;

  const Periods({required this.first, required this.second});

  @override
  List<Object?> get props => [first, second];
}

class Venue extends Equatable {
  final int id;
  final String name;
  final String city;

  const Venue({required this.id, required this.name, required this.city});

  @override
  List<Object?> get props => [id, name, city];
}

// class Status extends Equatable {
//   final String long;
//   final String short;
//   final int elapsed;

//   const Status(
//       {required this.long, required this.short, required this.elapsed});

//   @override
//   List<Object?> get props => [long, short, elapsed];
// }

class Teams extends Equatable {
  final Home home;
  final Home away;

  const Teams({required this.home, required this.away});

  @override
  List<Object?> get props => [home, away];
}

class Home extends Equatable {
  final int id;
  final String name;
  final String logo;
  final bool winner;

  const Home(
      {required this.id,
      required this.name,
      required this.logo,
      required this.winner});

  @override
  List<Object?> get props => [id, name, logo, winner];
}

class Goals extends Equatable {
  final int home;
  final int away;

  const Goals({required this.home, required this.away});

  @override
  List<Object?> get props => [home, away];
}

// class Score {
//   Goals halftime;
//   Goals fulltime;
//   Extratime extratime;
//   Extratime penalty;

//   Score(
//       {required this.halftime,
//       required this.fulltime,
//       required this.extratime,
//       required this.penalty});
// }

// class Extratime {
//   TeamsHome? home;
//   TeamsAway? away;

//   Extratime({this.home, this.away});
// }

class MatchEvent extends Equatable {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;
  final List<Event>? events;
  final List<LineUp>? lineups;
  final List<MatchStatistics>? statistics;
  // final List<PlayersResponse>? players;
  const MatchEvent({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    this.events,
    this.lineups,
    this.statistics,
    // this.players,
  });

  @override
  List<Object?> get props => [
        fixture,
        league,
        league,
        teams,
        goals,
        events,
        events,
        lineups,
        statistics
      ];
}

class Statistic extends Equatable {
  final String? type;
  final dynamic value;
  const Statistic({
    this.type,
    this.value,
  });

  @override
  List<Object?> get props => [type, value];
}

class MatchStatistics extends Equatable {
  final Team? team;
  final List<Statistic>? statistics;
  const MatchStatistics({
    this.team,
    this.statistics,
  });

  @override
  List<Object?> get props => [team, statistics];
}

class LineUp extends Equatable {
  final Team team;
  final String formation;
  final List<StartXI>? startXI;
  final List<Substitutes>? substitutes;
  final Coach? coach;
  const LineUp({
    required this.team,
    required this.formation,
    this.startXI,
    this.substitutes,
    this.coach,
  });

  @override
  List<Object?> get props => [team, formation, startXI, substitutes, coach];
}

class Substitutes extends Equatable {
  final Player? player;

  const Substitutes({
    this.player,
  });

  @override
  List<Object?> get props => [player];
}

class StartXI extends Equatable {
  final Player player;

  const StartXI({
    required this.player,
  });

  @override
  List<Object> get props => [player];
}

class Coach extends Equatable {
  final int id;
  final String name;
  final String? photo;

  const Coach({required this.id, required this.name, this.photo});

  @override
  List<Object> get props => [id, name, photo!];
}

class Event extends Equatable {
  final Time time;
  final Team team;
  final Player player;
  final Assist assist;
  final String type;
  final String detail;
  final String comments;
  const Event({
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
    required this.comments,
  });

  @override
  List<Object> get props {
    return [
      time,
      team,
      player,
      assist,
      type,
      detail,
      comments,
    ];
  }
}

class Time extends Equatable {
  final int? elapsed;
  final int? extra;

  const Time({this.elapsed, this.extra});

  @override
  List<Object> get props => [elapsed!, extra!];
}

class Team extends Equatable {
  final int id;
  final String name;
  final String logo;

  const Team(this.id, this.name, this.logo);

  @override
  List<Object> get props => [id, name, logo];
}

class Assist extends Equatable {
  final int? id;
  final String? name;

  const Assist({this.id, this.name});

  @override
  List<Object> get props => [id!, name!];
}

class Player extends Equatable {
  final int id;
  final String name;
  final int number;
  final String? pos;
  final String? grid;

  const Player(
      {required this.id,
      required this.name,
      required this.number,
      this.pos,
      this.grid});

  @override
  List<Object> get props {
    return [
      id,
      name,
      number,
      pos!,
      grid!,
    ];
  }
}
