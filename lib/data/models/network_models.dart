// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../response/responses.dart';

part 'network_models.g.dart';

@JsonSerializable()
class CountryResponse extends BaseResponse {
  String? name;
  String? code;
  String? flag;

  CountryResponse({required this.name, required this.code, required this.flag});

  @override
  Map<String, dynamic> toJson() {
    return _$CountryResponseToJson(this);
  }

  factory CountryResponse.fromJson(Map<String, dynamic> map) {
    return _$CountryResponseFromJson(map);
  }
}

@JsonSerializable()
class GetCompetitionsResponse extends BaseResponse {
  @JsonKey(name: "response")
  List<CompetitionResponse>? leagues;

  GetCompetitionsResponse({this.leagues});

  Map<String, dynamic> toMap() {
    return _$GetCompetitionsResponseToJson(this);
  }

  factory GetCompetitionsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCompetitionsResponseFromJson(json);
  }
}

@JsonSerializable()
class CompetitionResponse {
  @JsonKey(name: 'league')
  LeagueResponse? leagueResponse;
  @JsonKey(name: 'country')
  CountryResponse? countryResponse;
  CompetitionResponse({this.leagueResponse, this.countryResponse});

  Map<String, dynamic> toMap() {
    return _$CompetitionResponseToJson(this);
  }

  factory CompetitionResponse.fromJson(Map<String, dynamic> json) {
    return _$CompetitionResponseFromJson(json);
  }
}

@JsonSerializable()
class TeamsResponse {
  @JsonKey(name: 'home')
  HomeResponse? home;
  @JsonKey(name: 'away')
  HomeResponse? away;

  TeamsResponse({this.home, this.away});

  Map<String, dynamic> toMap() {
    return _$TeamsResponseToJson(this);
  }

  factory TeamsResponse.fromJson(Map<String, dynamic> json) {
    return _$TeamsResponseFromJson(json);
  }
}

@JsonSerializable()
class HomeResponse {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  HomeResponse({this.id, this.name, this.logo, this.winner});

  Map<String, dynamic> toMap() {
    return _$HomeResponseToJson(this);
  }

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseFromJson(json);
  }
}

@JsonSerializable()
class GoalsResponse {
  @JsonKey(name: 'home')
  @JsonKey(name: 'for')
  int? home;
  @JsonKey(
    name: 'away',
  )
  @JsonKey(name: 'against')
  int? away;
  GoalsResponse({
    this.home,
    this.away,
  });
  Map<String, dynamic> toMap() {
    return _$GoalsResponseToJson(this);
  }

  factory GoalsResponse.fromJson(Map<String, dynamic> json) {
    return _$GoalsResponseFromJson(json);
  }
}

@JsonSerializable()
class LeagueResponse {
  int? id;
  String? name;
  String? type;
  String? logo;
  String? country;
  String? flag;
  int? season;
  String? round;
  List<List<StandingResponse>>? standings;
  LeagueResponse(
      {this.id,
      this.name,
      this.type,
      this.logo,
      this.country,
      this.flag,
      this.season,
      this.round,
      this.standings});

  Map<String, dynamic> toMap() {
    return _$LeagueResponseToJson(this);
  }

  factory LeagueResponse.fromJson(Map<String, dynamic> json) {
    return _$LeagueResponseFromJson(json);
  }
}

@JsonSerializable()
class GetMatchesResonse extends BaseResponse {
  @JsonKey(name: 'response')
  List<MatchResponse>? matches;
  GetMatchesResonse({
    this.matches,
  });

  Map<String, dynamic> toMap() {
    return _$GetMatchesResonseToJson(this);
  }

  factory GetMatchesResonse.fromJson(Map<String, dynamic> json) {
    return _$GetMatchesResonseFromJson(json);
  }
}

@JsonSerializable()
class MatchResponse {
  FixtureResponse? fixture;
  LeagueResponse? league;
  TeamsResponse? teams;
  GoalsResponse? goals;

  MatchResponse({this.fixture, this.league, this.teams, this.goals});

  Map<String, dynamic> toMap() {
    return _$MatchResponseToJson(this);
  }

  factory MatchResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchResponseFromJson(json);
  }
}

@JsonSerializable()
class FixtureResponse {
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  PeriodsResponse? periods;
  VenueResponse? venue;
  StatusResponse? status;

  FixtureResponse(
      {this.id,
      this.referee,
      this.timezone,
      this.date,
      this.timestamp,
      this.periods,
      this.venue,
      this.status});

  Map<String, dynamic> toMap() {
    return _$FixtureResponseToJson(this);
  }

  factory FixtureResponse.fromJson(Map<String, dynamic> json) {
    return _$FixtureResponseFromJson(json);
  }
}

@JsonSerializable()
class PeriodsResponse {
  int? first;
  int? second;

  PeriodsResponse({this.first, this.second});

  Map<String, dynamic> toMap() {
    return _$PeriodsResponseToJson(this);
  }

  factory PeriodsResponse.fromJson(Map<String, dynamic> json) {
    return _$PeriodsResponseFromJson(json);
  }
}

@JsonSerializable()
class VenueResponse {
  int? id;
  String? name;
  String? city;

  VenueResponse({this.id, this.name, this.city});

  Map<String, dynamic> toMap() {
    return _$VenueResponseToJson(this);
  }

  factory VenueResponse.fromJson(Map<String, dynamic> json) {
    return _$VenueResponseFromJson(json);
  }
}

@JsonSerializable()
class StatusResponse {
  String? long;
  String? short;
  int? elapsed;

  StatusResponse({this.long, this.short, this.elapsed});

  Map<String, dynamic> toMap() {
    return _$StatusResponseToJson(this);
  }

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return _$StatusResponseFromJson(json);
  }
}

@JsonSerializable()
class MatchEventResponse {
  final FixtureResponse? fixture;
  final LeagueResponse? league;
  final TeamsResponse? teams;
  final GoalsResponse? goals;
  final List<EventResponse>? events;
  final List<LineUpResponse>? lineups;
  final List<MatchStatisticsResponse>? statistics;
  // final List<PlayersResponse>? players;
  MatchEventResponse({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.events,
    this.lineups,
    this.statistics,
    // this.players,
  });

  Map<String, dynamic> toMap() {
    return _$MatchEventResponseToJson(this);
  }

  factory MatchEventResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchEventResponseFromJson(json);
  }
}

@JsonSerializable()
class StandingsResponse {
  LeagueResponse? league;
  StandingsResponse({
    this.league,
  });
  Map<String, dynamic> toMap() {
    return _$StandingsResponseToJson(this);
  }

  factory StandingsResponse.fromJson(Map<String, dynamic> json) {
    return _$StandingsResponseFromJson(json);
  }
}

@JsonSerializable()
class StandingResponse {
  final int? rank;
  final TeamResponse? team;
  final int? points;
  final int? goalsDiff;
  final String? group;
  final String? form;
  final String? status;
  final String? description;
  final AllResponse? all;
  const StandingResponse(
    this.rank,
    this.team,
    final this.points,
    this.goalsDiff,
    this.group,
    this.form,
    this.status,
    this.description,
    this.all,
  );

  Map<String, dynamic> toMap() {
    return _$StandingResponseToJson(this);
  }

  factory StandingResponse.fromJson(Map<String, dynamic> json) {
    return _$StandingResponseFromJson(json);
  }
}

@JsonSerializable()
class AllResponse {
  final int? played;
  final int? win;
  final int? draw;
  final int? lose;
  final GoalsResponse? goals;
  const AllResponse(
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  );
  Map<String, dynamic> toMap() {
    return _$AllResponseToJson(this);
  }

  factory AllResponse.fromJson(Map<String, dynamic> json) {
    return _$AllResponseFromJson(json);
  }
}

// @JsonSerializable()
// class PlayersResponse {
//   final TeamResponse? team;
// //  final List<PlayerStatisticsResponse>? players;
//   const PlayersResponse({
//     this.team,
//     //   this.players,
//   });
// }

// @JsonSerializable()
// class PlayerStatisticsResponse {

// }

@JsonSerializable()
class MatchStatisticsResponse {
  final TeamResponse? team;
  final List<StatisticResponse>? statistics;
  const MatchStatisticsResponse({
    this.team,
    this.statistics,
  });
  Map<String, dynamic> toMap() {
    return _$MatchStatisticsResponseToJson(this);
  }

  factory MatchStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return _$MatchStatisticsResponseFromJson(json);
  }
}

@JsonSerializable()
class StatisticResponse {
  final String? type;
  final dynamic value;
  const StatisticResponse({
    this.type,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return _$StatisticResponseToJson(this);
  }

  factory StatisticResponse.fromJson(Map<String, dynamic> json) {
    return _$StatisticResponseFromJson(json);
  }
}

@JsonSerializable()
class LineUpResponse {
  TeamResponse? team;
  String? formation;
  List<StartXIResponse>? startXI;
  List<SubstitutesResponse>? substitutes;
  CoachResponse? coach;
  LineUpResponse({
    this.team,
    this.formation,
    this.startXI,
    this.substitutes,
    this.coach,
  });

  Map<String, dynamic> toMap() {
    return _$LineUpResponseToJson(this);
  }

  factory LineUpResponse.fromJson(Map<String, dynamic> json) {
    return _$LineUpResponseFromJson(json);
  }
}

@JsonSerializable()
class SubstitutesResponse {
  PlayerResponse? player;

  SubstitutesResponse({
    this.player,
  });

  Map<String, dynamic> toMap() {
    return _$SubstitutesResponseToJson(this);
  }

  factory SubstitutesResponse.fromJson(Map<String, dynamic> json) {
    return _$SubstitutesResponseFromJson(json);
  }
}

@JsonSerializable()
class StartXIResponse {
  PlayerResponse? player;

  StartXIResponse({
    this.player,
  });

  Map<String, dynamic> toMap() {
    return _$StartXIResponseToJson(this);
  }

  factory StartXIResponse.fromJson(Map<String, dynamic> json) {
    return _$StartXIResponseFromJson(json);
  }
}

@JsonSerializable()
class PlayerResponse {
  int? id;
  String? name;
  int? number;
  String? pos;
  String? grid;

  PlayerResponse({this.id, this.name, this.number, this.pos, this.grid});

  Map<String, dynamic> toMap() {
    return _$PlayerResponseToJson(this);
  }

  factory PlayerResponse.fromJson(Map<String, dynamic> json) {
    return _$PlayerResponseFromJson(json);
  }
}

@JsonSerializable()
class CoachResponse {
  int? id;
  String? name;
  String? photo;

  CoachResponse({this.id, this.name, this.photo});

  Map<String, dynamic> toMap() {
    return _$CoachResponseToJson(this);
  }

  factory CoachResponse.fromJson(Map<String, dynamic> json) {
    return _$CoachResponseFromJson(json);
  }
}

@JsonSerializable()
class EventResponse {
  TimeResponse? time;
  TeamResponse? team;
  PlayerResponse? player;
  AssistResponse? assist;
  String? type;
  String? detail;
  String? comments;
  EventResponse({
    this.time,
    this.team,
    this.player,
    this.assist,
    this.type,
    this.detail,
    this.comments,
  });

  Map<String, dynamic> toMap() {
    return _$EventResponseToJson(this);
  }

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return _$EventResponseFromJson(json);
  }
}

@JsonSerializable()
class TimeResponse {
  int? elapsed;
  int? extra;

  TimeResponse({this.elapsed, this.extra});

  Map<String, dynamic> toMap() {
    return _$TimeResponseToJson(this);
  }

  factory TimeResponse.fromJson(Map<String, dynamic> json) {
    return _$TimeResponseFromJson(json);
  }
}

@JsonSerializable()
class TeamResponse {
  int? id;
  String? name;
  String? logo;

  TeamResponse({this.id, this.name, this.logo});

  Map<String, dynamic> toMap() {
    return _$TeamResponseToJson(this);
  }

  factory TeamResponse.fromJson(Map<String, dynamic> json) {
    return _$TeamResponseFromJson(json);
  }
}

@JsonSerializable()
class AssistResponse {
  int? id;
  String? name;

  AssistResponse({this.id, this.name});

  Map<String, dynamic> toMap() {
    return _$AssistResponseToJson(this);
  }

  factory AssistResponse.fromJson(Map<String, dynamic> json) {
    return _$AssistResponseFromJson(json);
  }
}

@JsonSerializable()
class GetStandingsResponse {
  @JsonKey(name: 'response')
  List<StandingsResponse>? standings;
  GetStandingsResponse({this.standings});

  Map<String, dynamic> toMap() {
    return _$GetStandingsResponseToJson(this);
  }

  factory GetStandingsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetStandingsResponseFromJson(json);
  }
}

@JsonSerializable()
class GetMatcheEventResponse extends BaseResponse {
  @JsonKey(name: 'response')
  List<MatchEventResponse>? matches;
  GetMatcheEventResponse({
    this.matches,
  });

  Map<String, dynamic> toMap() {
    return _$GetMatcheEventResponseToJson(this);
  }

  factory GetMatcheEventResponse.fromJson(Map<String, dynamic> json) {
    return _$GetMatcheEventResponseFromJson(json);
  }
}
