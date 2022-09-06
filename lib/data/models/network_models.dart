// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:live_soccer/domain/entities/fixtures.dart';

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
  int? home;
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
  LeagueResponse({
    this.id,
    this.name,
    this.type,
    this.logo,
    this.country,
    this.flag,
    this.season,
    this.round,
  });

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
