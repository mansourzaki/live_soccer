import 'dart:developer';

import 'package:live_soccer/app/constants.dart';
import 'package:live_soccer/data/response/responses.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/app/extensions.dart';

import '../models/network_models.dart';

extension LeagueResponseMapper on LeagueResponse? {
  League toDomain() {
    return League(
      id: this?.id.orZero() ?? Constants.ZERO,
      name: this?.name.orEmpty() ?? Constants.EMPTY,
      type: this?.type.orEmpty() ?? Constants.EMPTY,
      logo: this?.logo.orEmpty() ?? Constants.EMPTY,
      country: this?.country.orEmpty() ?? Constants.EMPTY,
      flag: this?.flag.orEmpty() ?? Constants.EMPTY,
      round: this?.round.orEmpty() ?? Constants.EMPTY,
      season: this?.season.orZero() ?? Constants.ZERO,
    );
  }
}

extension GetCountriesResponseMapper on GetCountriesResponse? {
  List<Country> toDomain() {
    log('message mapper');
    if (this == null) {
      return [];
    } else {
      return this!.countries.map((e) => e.toDomain()).toList();
    }
  }
}

extension GetCompetionsResponseMapper on GetCompetitionsResponse? {
  List<Competion> toDomain() {
    log('message mapper');
    if (this == null) {
      return [];
    } else {
      log('mapper of getleague respone');
      return this!.leagues!.map((e) => e.toDomain()).toList();
      // return this!.leagues?.map((e) => e.toDomain()).toList() ?? [];
    }
  }
}

extension GetMatchesResponseMapper on GetMatchesResonse? {
  List<FootballMatch> toDomain() {
    log('message mapper');
    if (this == null) {
      return [];
    } else {
      //log('mapper of getleague respone');
      return this!.matches!.map((e) => e.toDomain()).toList();
      // return this!.leagues?.map((e) => e.toDomain()).toList() ?? [];
    }
  }
}

extension GetStandingsResponseMapper on GetStandingsResponse? {
  List<Standing> toDomain() {
    print('message mapper in standing mapper');
    if (this == null) {
      return [];
    } else {
      log('standings');
      // log(this!.standings!.standings.toDomain());
      //log('mapper of getleague respone');
      return this!.standings!.first.league!.standings!.first.map((e) => e.toDomain()).toList();
      // return this!.leagues?.map((e) => e.toDomain()).toList() ?? [];
    }
  }
}

extension GetMatcheEventResponseMapper on GetMatcheEventResponse? {
  MatchEvent? toDomain() {
    log('message mapper');
    if (this == null) {
      return null;
    } else {
      //log('mapper of getleague respone');
      return this!.matches![0].toDomain();
      // return this!.leagues?.map((e) => e.toDomain()).toList() ?? [];
    }
  }
}

extension CompetionResponseMapper on CompetitionResponse? {
  Competion toDomain() {
    return Competion(
        country: this!.countryResponse.toDomain(),
        league: this!.leagueResponse.toDomain());
  }
}

extension StandingResponseMapper on StandingResponse? {
  Standing toDomain() {
    return Standing(
        rank: this?.rank.orZero() ?? Constants.ZERO,
        team: this!.team.toDomain(),
        points: this?.points.orZero() ?? Constants.ZERO,
        goalsDiff: this?.goalsDiff.orZero() ?? Constants.ZERO,
        group: this?.group.orEmpty() ?? Constants.EMPTY,
        form: this?.group.orEmpty() ?? Constants.EMPTY,
        status: this?.group.orEmpty() ?? Constants.EMPTY,
        description: this?.group.orEmpty() ?? Constants.EMPTY,
        all: this!.all.toDomain());
  }
}

extension AllResponseMapper on AllResponse? {
  All toDomain() {
    final x = GoalsResponse(home: 2, away: 3);
    return All(
        draw: this?.draw.orZero() ?? Constants.ZERO,
        win: this?.win.orZero() ?? Constants.ZERO,
        goals: x.toDomain(),
        lose: this?.lose.orZero() ?? Constants.ZERO,
        played: this?.played.orZero() ?? Constants.ZERO);
  }
}

extension CountryResponseMapper on CountryResponse? {
  Country toDomain() {
    log('message mapper2');
    return Country(
        code: this?.code.orEmpty() ?? "",
        flag: this?.flag?.orEmpty() ?? Constants.worldLogo,
        name: this?.name.orEmpty() ?? "");
  }
}

extension MatchResponseMapper on MatchResponse? {
  FootballMatch toDomain() {
    //log('mapper of getleague respone');
    return FootballMatch(
        fixture: this!.fixture.toDomain(),
        league: this!.league.toDomain(),
        teams: this!.teams.toDomain(),
        goals: this!.goals.toDomain());
  }
}

extension MatchEventsMapper on MatchEventResponse? {
  MatchEvent toDomain() {
    //log('mapper of getleague respone');
    return MatchEvent(
      fixture: this!.fixture.toDomain(),
      league: this!.league.toDomain(),
      teams: this!.teams.toDomain(),
      goals: this!.goals.toDomain(),
      events: this!.events?.map((e) => e.toDomain()).toList(),
      lineups: this!.lineups?.map((e) => e.toDomain()).toList(),
      statistics: this!.statistics?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension StatisticResponseMapper on StatisticResponse? {
  Statistic toDomain() {
    //log('mapper of getleague respone');
    return Statistic(
      type: this!.type.orEmpty(),
      value: this!.value,
    );
  }
}

extension MatchStatisticsMapper on MatchStatisticsResponse? {
  MatchStatistics toDomain() {
    //log('mapper of getleague respone');
    return MatchStatistics(
      team: this!.team.toDomain(),
      statistics: this!.statistics?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension TeamResponseMapper on TeamResponse? {
  Team toDomain() {
    //log('mapper of getleague respone');
    return Team(this?.id.orZero() ?? Constants.ZERO,
        this?.name ?? Constants.EMPTY, this?.logo.orEmpty() ?? Constants.EMPTY);
  }
}

extension CoachResponseMapper on CoachResponse? {
  Coach toDomain() {
    //log('mapper of getleague respone');
    return Coach(
        id: this?.id.orZero() ?? Constants.ZERO,
        name: this?.name ?? Constants.EMPTY,
        photo: this?.photo.orEmpty() ?? Constants.EMPTY);
  }
}

extension TimeResponseMapper on TimeResponse? {
  Time toDomain() {
    //log('mapper of getleague respone');
    return Time(
        elapsed: this?.elapsed.orZero() ?? Constants.ZERO,
        extra: this?.extra.orZero() ?? Constants.ZERO);
  }
}

extension AssistResponseMapper on AssistResponse? {
  Assist toDomain() {
    //log('mapper of getleague respone');
    return Assist(
        id: this?.id.orZero() ?? Constants.ZERO,
        name: this?.name.orEmpty() ?? Constants.EMPTY);
  }
}

extension SubstitutesMapper on SubstitutesResponse? {
  Substitutes toDomain() {
    //log('mapper of getleague respone');
    return Substitutes(player: this!.player.toDomain());
  }
}

extension PlayerResponseMapper on PlayerResponse? {
  Player toDomain() {
    //log('mapper of getleague respone');
    return Player(
        id: this?.id.orZero() ?? Constants.ZERO,
        name: this?.name.orEmpty() ?? Constants.EMPTY,
        number: this?.number.orZero() ?? Constants.ZERO);
  }
}

extension LineUpMapper on LineUpResponse? {
  LineUp toDomain() {
    //log('mapper of getleague respone');
    return LineUp(
      team: this!.team.toDomain(),
      coach: this!.coach.toDomain(),
      formation: this!.formation.orEmpty(),
      startXI: this?.startXI?.map((e) => e.toDomain()).toList(),
      substitutes: this!.substitutes?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension StartXIResponseMapper on StartXIResponse? {
  StartXI toDomain() {
    //log('mapper of getleague respone');
    return StartXI(player: this!.player.toDomain());
  }
}

extension EventsMapper on EventResponse? {
  Event toDomain() {
    //log('mapper of getleague respone');
    return Event(
      team: this!.team.toDomain(),
      assist: this!.assist.toDomain(),
      comments: this?.comments.orEmpty() ?? Constants.EMPTY,
      detail: this?.detail.orEmpty() ?? Constants.EMPTY,
      player: this!.player.toDomain(),
      time: this!.time.toDomain(),
      type: this?.type.orEmpty() ?? Constants.EMPTY,
    );
  }
}

extension FixtureResponseMapper on FixtureResponse? {
  Fixture toDomain() {
    log('message mapper2');
    return Fixture(
        id: this?.id.orZero() ?? 0,
        timestamp: this?.timestamp.orZero() ?? 0,
        timezone: this?.timezone.orEmpty() ?? "",
        date: this?.timezone.orEmpty() ?? "",
        periods: this?.periods.toDomain() ?? const Periods(first: 0, second: 0),
        referee: this?.referee.orEmpty() ?? "",
        venue: this?.venue.toDomain() ?? const Venue(id: 0, name: '', city: ''),
        status:
            this?.status.toDomain() ?? Status(long: '', short: '', elapsed: 0));
  }
}

extension VenueResponseMapper on VenueResponse? {
  Venue toDomain() {
    log('message mapper2');
    return Venue(
        city: this?.city.orEmpty() ?? "",
        id: this?.id.orZero() ?? Constants.ZERO,
        name: this?.name.orEmpty() ?? "");
  }
}

extension StatusResponseMapper on StatusResponse? {
  Status toDomain() {
    log('message mapper2');
    return Status(
        long: this?.long.orEmpty() ?? "",
        elapsed: this?.elapsed.orZero() ?? Constants.ZERO,
        short: this?.short.orEmpty() ?? "");
  }
}

extension TeamsResponseMapper on TeamsResponse? {
  Teams toDomain() {
    log('message mapper2');
    return Teams(
      home: this?.home.toDomain() ??
          const Home(id: 0, name: '', logo: '', winner: false),
      away: this?.away.toDomain() ??
          const Home(id: 0, name: '', logo: '', winner: false),
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  Home toDomain() {
    log('message mapper2');
    return Home(
      id: this?.id.orZero() ?? Constants.ZERO,
      logo: this?.logo.orEmpty() ?? Constants.EMPTY,
      name: this?.name.orEmpty() ?? Constants.EMPTY,
      winner: this?.winner ?? false,
    );
  }
}

extension GoalsResponseMapper on GoalsResponse? {
  Goals toDomain() {
    log('message mapper2');
    return Goals(
      home: this?.home.orZero() ?? Constants.ZERO,
      away: this?.away.orZero() ?? Constants.ZERO,
    );
  }
}

extension PerriodsResponseMapper on PeriodsResponse? {
  Periods toDomain() {
    log('message mapper2');
    return Periods(
      first: this?.first.orZero() ?? 0,
      second: this?.second.orZero() ?? 0,
    );
  }
}
