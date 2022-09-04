import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<GetCountriesResponse> getCountries();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  AppService _appService;
  RemoteDataSourceImpl(
    this._appService,
  );

  @override
  Future<GetCountriesResponse> getCountries() async {
    return await _appService.getCountries();
  }
}
