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
      log('mapper of getleague respone');
      return this!.matches!.map((e) => e.toDomain()).toList();
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
    log('mapper of getleague respone');
    return FootballMatch(
        fixture: this!.fixture.toDomain(),
        league: this!.league.toDomain(),
        teams: this!.teams.toDomain(),
        goals: this!.goals.toDomain());
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
