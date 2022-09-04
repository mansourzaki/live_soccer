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
        logo: this?.logo.orEmpty() ?? Constants.EMPTY);
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

extension CountryResponseMapper on CountryResponse? {
  Country toDomain() {
    log('message mapper2');
    return Country(
        code: this?.code.orEmpty() ?? "",
        flag: this?.flag.orEmpty() ?? "",
        name: this?.name.orEmpty() ?? "");
  }
}

// extension LeaguesResponseMapper on LeaguesResponse? {
//   Leagues toDomain() {
//     return Leagues(
//       league: this?.league.toDomain(),
//       country: this?.country.toDomain(),
//     );
//   }
// }
