import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/data/response/responses.dart';

import '../models/network_models.dart';

abstract class RemoteDataSource {
  Future<GetCountriesResponse> getCountries();
  Future<GetCompetitionsResponse> getCompetions(
      CompetionsRequest leaguesRequest, Map<String, dynamic> map);
  Future<GetMatchesResonse> getMatches(Map<String, dynamic> map);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppService _appService;
  RemoteDataSourceImpl(
    this._appService,
  );

  @override
  Future<GetCountriesResponse> getCountries() async {
    return await _appService.getCountries();
  }

  @override
  Future<GetCompetitionsResponse> getCompetions(
      CompetionsRequest competitionsRequest, Map<String, dynamic> map) async {
    return await _appService.getCompetions(
        season: competitionsRequest.season, queruies: map);
  }

  @override
  Future<GetMatchesResonse> getMatches(Map<String, dynamic> map) async {
    return await _appService.getMatches(queruies: map);
  }
}
