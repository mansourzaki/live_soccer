import 'entities.dart';

class Fixtures {
  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;

  Fixtures(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals,
      required this.score});
}

class Fixture {
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
}

class Periods {
  int first;
  int second;

  Periods({required this.first, required this.second});
}

class Venue {
  int id;
  String name;
  String city;

  Venue({required this.id, required this.name, required this.city});
}

class Status {
  String long;
  String short;
  int elapsed;

  Status({required this.long, required this.short, required this.elapsed});
}

class Teams {
  TeamsHome home;
  TeamsAway away;

  Teams({required this.home, required this.away});
}

class TeamsHome {
  int id;
  String name;
  String logo;
  bool winner;

  TeamsHome(
      {required this.id,
      required this.name,
      required this.logo,
      required this.winner});
}

class TeamsAway{
  int id;
  String name;
  String logo;
  bool winner;

  TeamsAway(
      {required this.id,
      required this.name,
      required this.logo,
      required this.winner});
}


class Goals {
  int home;
  int away;

  Goals({required this.home, required this.away});
}

class Score {
  Goals halftime;
  Goals fulltime;
  Extratime extratime;
  Extratime penalty;

  Score(
      {required this.halftime,
      required this.fulltime,
      required this.extratime,
      required this.penalty});
}

class Extratime {
  TeamsHome? home;
  TeamsAway? away;

  Extratime({this.home, this.away});
}
