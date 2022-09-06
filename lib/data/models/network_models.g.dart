// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      name: json['name'] as String?,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    )
      ..get = json['get'] as String?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

GetCompetitionsResponse _$GetCompetitionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCompetitionsResponse(
      leagues: (json['response'] as List<dynamic>?)
          ?.map((e) => CompetitionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCompetitionsResponseToJson(
        GetCompetitionsResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.leagues,
    };

CompetitionResponse _$CompetitionResponseFromJson(Map<String, dynamic> json) =>
    CompetitionResponse(
      leagueResponse: json['league'] == null
          ? null
          : LeagueResponse.fromJson(json['league'] as Map<String, dynamic>),
      countryResponse: json['country'] == null
          ? null
          : CountryResponse.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompetitionResponseToJson(
        CompetitionResponse instance) =>
    <String, dynamic>{
      'league': instance.leagueResponse,
      'country': instance.countryResponse,
    };

TeamsResponse _$TeamsResponseFromJson(Map<String, dynamic> json) =>
    TeamsResponse(
      home: json['home'] == null
          ? null
          : HomeResponse.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : HomeResponse.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsResponseToJson(TeamsResponse instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

GoalsResponse _$GoalsResponseFromJson(Map<String, dynamic> json) =>
    GoalsResponse(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$GoalsResponseToJson(GoalsResponse instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

LeagueResponse _$LeagueResponseFromJson(Map<String, dynamic> json) =>
    LeagueResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      country: json['country'] as String?,
      flag: json['flag'] as String?,
      season: json['season'] as int?,
      round: json['round'] as String?,
    );

Map<String, dynamic> _$LeagueResponseToJson(LeagueResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
      'country': instance.country,
      'flag': instance.flag,
      'season': instance.season,
      'round': instance.round,
    };

GetMatchesResonse _$GetMatchesResonseFromJson(Map<String, dynamic> json) =>
    GetMatchesResonse(
      matches: (json['response'] as List<dynamic>?)
          ?.map((e) => MatchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMatchesResonseToJson(GetMatchesResonse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.matches,
    };

MatchResponse _$MatchResponseFromJson(Map<String, dynamic> json) =>
    MatchResponse(
      fixture: json['fixture'] == null
          ? null
          : FixtureResponse.fromJson(json['fixture'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : LeagueResponse.fromJson(json['league'] as Map<String, dynamic>),
      teams: json['teams'] == null
          ? null
          : TeamsResponse.fromJson(json['teams'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : GoalsResponse.fromJson(json['goals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchResponseToJson(MatchResponse instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
    };

FixtureResponse _$FixtureResponseFromJson(Map<String, dynamic> json) =>
    FixtureResponse(
      id: json['id'] as int?,
      referee: json['referee'] as String?,
      timezone: json['timezone'] as String?,
      date: json['date'] as String?,
      timestamp: json['timestamp'] as int?,
      periods: json['periods'] == null
          ? null
          : PeriodsResponse.fromJson(json['periods'] as Map<String, dynamic>),
      venue: json['venue'] == null
          ? null
          : VenueResponse.fromJson(json['venue'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : StatusResponse.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureResponseToJson(FixtureResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'periods': instance.periods,
      'venue': instance.venue,
      'status': instance.status,
    };

PeriodsResponse _$PeriodsResponseFromJson(Map<String, dynamic> json) =>
    PeriodsResponse(
      first: json['first'] as int?,
      second: json['second'] as int?,
    );

Map<String, dynamic> _$PeriodsResponseToJson(PeriodsResponse instance) =>
    <String, dynamic>{
      'first': instance.first,
      'second': instance.second,
    };

VenueResponse _$VenueResponseFromJson(Map<String, dynamic> json) =>
    VenueResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$VenueResponseToJson(VenueResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

StatusResponse _$StatusResponseFromJson(Map<String, dynamic> json) =>
    StatusResponse(
      long: json['long'] as String?,
      short: json['short'] as String?,
      elapsed: json['elapsed'] as int?,
    );

Map<String, dynamic> _$StatusResponseToJson(StatusResponse instance) =>
    <String, dynamic>{
      'long': instance.long,
      'short': instance.short,
      'elapsed': instance.elapsed,
    };
