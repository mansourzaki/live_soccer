// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      get: json['get'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>?,
      errors: json['errors'] as List<dynamic>?,
      results: json['results'] as int?,
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      current: json['current'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'current': instance.current,
      'total': instance.total,
    };

CountriesResponse _$GetCountriesResponseFromJson(
        Map<String, dynamic> json) =>
    CountriesResponse(
      countries: (json['response'] as List<dynamic>)
          .map((e) => CountryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..parameters = json['parameters'] as Map<String, dynamic>?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCountriesResponseToJson(
        CountriesResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.countries,
    };

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      name: json['name'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String,
    )
      ..get = json['get'] as String?
      ..parameters = json['parameters'] as Map<String, dynamic>?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

LeaguesResponse _$LeaguesResponseFromJson(Map<String, dynamic> json) =>
    LeaguesResponse(
      league: json['league'] == null
          ? null
          : LeagueResponse.fromJson(json['league'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : CountryResponse.fromJson(json['country'] as Map<String, dynamic>),
    )
      ..get = json['get'] as String?
      ..parameters = json['parameters'] as Map<String, dynamic>?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$LeaguesResponseToJson(LeaguesResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'league': instance.league,
      'country': instance.country,
    };

LeagueResponse _$LeagueResponseFromJson(Map<String, dynamic> json) =>
    LeagueResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$LeagueResponseToJson(LeagueResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };
