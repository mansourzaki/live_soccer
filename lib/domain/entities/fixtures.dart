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
