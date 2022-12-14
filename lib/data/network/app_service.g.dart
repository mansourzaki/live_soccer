// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppService implements AppService {
  _AppService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api-football-v1.p.rapidapi.com/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetCountriesResponse> getCountries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCountriesResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/countries',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCountriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCompetitionsResponse> getCompetions(
      {required season, required queruies}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'season': season};
    queryParameters.addAll(queruies);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCompetitionsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/leagues',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCompetitionsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMatchesResonse> getMatches({required queruies}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queruies);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMatchesResonse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/fixtures',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMatchesResonse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMatcheEventResponse> getMatchEvents({required fixture}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': fixture};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMatcheEventResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/fixtures',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMatcheEventResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStandingsResponse> getStandings(
      {required league, required season}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'league': league,
      r'season': season
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetStandingsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/standings',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStandingsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
