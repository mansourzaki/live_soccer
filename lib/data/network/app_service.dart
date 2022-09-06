import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:live_soccer/app/constants.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

import '../models/network_models.dart';
import '../response/responses.dart';
part 'app_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;
  @GET('/countries')
  Future<GetCountriesResponse> getCountries();

  @GET('/leagues')
  Future<GetCompetitionsResponse> getCompetions({
    @Query('season') required int season,
    @Queries() required Map<String, dynamic> queruies,
  });

  @GET('/fixtures')
  Future<GetMatchesResonse> getMatches({
    @Queries() required Map<String, dynamic> queruies,
  });

  //requires one parameter at least
  // @GET('/teams')
  // Future<List<Teams>> getTeams(
  //     {@Query('id') int id,
  //     @Query('country') String country,
  //     @Query('season') int season,
  //     @Query('search') String search});

  // @GET('/teams/statistics')
  // Future<List<Teams>> getTeamStatstics({
  //   @Query('team') required int teamId,
  //   @Query('season') required String season,
  //   @Query('league') required int league,
  // });

  // @GET('/standings')
  // Future<List<League>> getStandings({
  //   @Query('team') int teamId,
  //   @Query('season') required String season,
  //   @Query('league') required int league,
  // });

  // @GET('/fixtures')
  // Future<List<Fixtures>> getFixturesOfLeague({
  //   @Query('league') required int leagueId,
  //   @Query('season') required int season,
  // });

  // @GET('/fixtures')
  // Future<List<Fixtures>> getFixturesLive({
  //   @Query('league') int leagueId,
  //   @Query('live') String live = 'all',
  //   @Query('season') int season,
  // });

  // @GET('/fixtures')
  // Future<List<Fixtures>> getNotStarted({
  //   @Query('league') int leagueId,
  //   @Query('season') int season,
  //   @Query('status') String status = 'NS',
  // });

  // @GET('/fixtures/headtohead')
  // Future<List<Fixtures>> getHeahToHead({
  //   @Query('h2h') required String h2h,
  //   @Query('season') int season,
  // });

  // @GET('/fixtures/statistics')
  // Future<List<Map<String, dynamic>>> getFixtureStatistics({
  //   @Query('fixture') required int fixture,
  //   @Query('team') int team,
  // });
}
