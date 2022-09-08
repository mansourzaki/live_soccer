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
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
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
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCompetitionsResponseToJson(
        GetCompetitionsResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
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
      standings: (json['standings'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => StandingResponse.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
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
      'standings': instance.standings,
    };

GetMatchesResonse _$GetMatchesResonseFromJson(Map<String, dynamic> json) =>
    GetMatchesResonse(
      matches: (json['response'] as List<dynamic>?)
          ?.map((e) => MatchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMatchesResonseToJson(GetMatchesResonse instance) =>
    <String, dynamic>{
      'get': instance.get,
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

MatchEventResponse _$MatchEventResponseFromJson(Map<String, dynamic> json) =>
    MatchEventResponse(
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
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineups: (json['lineups'] as List<dynamic>?)
          ?.map((e) => LineUpResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistics: (json['statistics'] as List<dynamic>?)
          ?.map((e) =>
              MatchStatisticsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchEventResponseToJson(MatchEventResponse instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'events': instance.events,
      'lineups': instance.lineups,
      'statistics': instance.statistics,
    };

StandingsResponse _$StandingsResponseFromJson(Map<String, dynamic> json) =>
    StandingsResponse(
      league: json['league'] == null
          ? null
          : LeagueResponse.fromJson(json['league'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StandingsResponseToJson(StandingsResponse instance) =>
    <String, dynamic>{
      'league': instance.league,
    };

StandingResponse _$StandingResponseFromJson(Map<String, dynamic> json) =>
    StandingResponse(
      json['rank'] as int?,
      json['team'] == null
          ? null
          : TeamResponse.fromJson(json['team'] as Map<String, dynamic>),
      json['points'] as int?,
      json['goalsDiff'] as int?,
      json['group'] as String?,
      json['form'] as String?,
      json['status'] as String?,
      json['description'] as String?,
      json['all'] == null
          ? null
          : AllResponse.fromJson(json['all'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StandingResponseToJson(StandingResponse instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'team': instance.team,
      'points': instance.points,
      'goalsDiff': instance.goalsDiff,
      'group': instance.group,
      'form': instance.form,
      'status': instance.status,
      'description': instance.description,
      'all': instance.all,
    };

AllResponse _$AllResponseFromJson(Map<String, dynamic> json) => AllResponse(
      json['played'] as int?,
      json['win'] as int?,
      json['draw'] as int?,
      json['lose'] as int?,
      json['goals'] == null
          ? null
          : GoalsResponse.fromJson(json['goals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllResponseToJson(AllResponse instance) =>
    <String, dynamic>{
      'played': instance.played,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'goals': instance.goals,
    };

MatchStatisticsResponse _$MatchStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    MatchStatisticsResponse(
      team: json['team'] == null
          ? null
          : TeamResponse.fromJson(json['team'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>?)
          ?.map((e) => StatisticResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchStatisticsResponseToJson(
        MatchStatisticsResponse instance) =>
    <String, dynamic>{
      'team': instance.team,
      'statistics': instance.statistics,
    };

StatisticResponse _$StatisticResponseFromJson(Map<String, dynamic> json) =>
    StatisticResponse(
      type: json['type'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$StatisticResponseToJson(StatisticResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

LineUpResponse _$LineUpResponseFromJson(Map<String, dynamic> json) =>
    LineUpResponse(
      team: json['team'] == null
          ? null
          : TeamResponse.fromJson(json['team'] as Map<String, dynamic>),
      formation: json['formation'] as String?,
      startXI: (json['startXI'] as List<dynamic>?)
          ?.map((e) => StartXIResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      substitutes: (json['substitutes'] as List<dynamic>?)
          ?.map((e) => SubstitutesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      coach: json['coach'] == null
          ? null
          : CoachResponse.fromJson(json['coach'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LineUpResponseToJson(LineUpResponse instance) =>
    <String, dynamic>{
      'team': instance.team,
      'formation': instance.formation,
      'startXI': instance.startXI,
      'substitutes': instance.substitutes,
      'coach': instance.coach,
    };

SubstitutesResponse _$SubstitutesResponseFromJson(Map<String, dynamic> json) =>
    SubstitutesResponse(
      player: json['player'] == null
          ? null
          : PlayerResponse.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubstitutesResponseToJson(
        SubstitutesResponse instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

StartXIResponse _$StartXIResponseFromJson(Map<String, dynamic> json) =>
    StartXIResponse(
      player: json['player'] == null
          ? null
          : PlayerResponse.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartXIResponseToJson(StartXIResponse instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

PlayerResponse _$PlayerResponseFromJson(Map<String, dynamic> json) =>
    PlayerResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      number: json['number'] as int?,
      pos: json['pos'] as String?,
      grid: json['grid'] as String?,
    );

Map<String, dynamic> _$PlayerResponseToJson(PlayerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'pos': instance.pos,
      'grid': instance.grid,
    };

CoachResponse _$CoachResponseFromJson(Map<String, dynamic> json) =>
    CoachResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$CoachResponseToJson(CoachResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) =>
    EventResponse(
      time: json['time'] == null
          ? null
          : TimeResponse.fromJson(json['time'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : TeamResponse.fromJson(json['team'] as Map<String, dynamic>),
      player: json['player'] == null
          ? null
          : PlayerResponse.fromJson(json['player'] as Map<String, dynamic>),
      assist: json['assist'] == null
          ? null
          : AssistResponse.fromJson(json['assist'] as Map<String, dynamic>),
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'time': instance.time,
      'team': instance.team,
      'player': instance.player,
      'assist': instance.assist,
      'type': instance.type,
      'detail': instance.detail,
      'comments': instance.comments,
    };

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) => TimeResponse(
      elapsed: json['elapsed'] as int?,
      extra: json['extra'] as int?,
    );

Map<String, dynamic> _$TimeResponseToJson(TimeResponse instance) =>
    <String, dynamic>{
      'elapsed': instance.elapsed,
      'extra': instance.extra,
    };

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) => TeamResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$TeamResponseToJson(TeamResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

AssistResponse _$AssistResponseFromJson(Map<String, dynamic> json) =>
    AssistResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AssistResponseToJson(AssistResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GetStandingsResponse _$GetStandingsResponseFromJson(
        Map<String, dynamic> json) =>
    GetStandingsResponse(
      standings: (json['response'] as List<dynamic>?)
          ?.map((e) => StandingsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStandingsResponseToJson(
        GetStandingsResponse instance) =>
    <String, dynamic>{
      'response': instance.standings,
    };

GetMatcheEventResponse _$GetMatcheEventResponseFromJson(
        Map<String, dynamic> json) =>
    GetMatcheEventResponse(
      matches: (json['response'] as List<dynamic>?)
          ?.map((e) => MatchEventResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMatcheEventResponseToJson(
        GetMatcheEventResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.matches,
    };
