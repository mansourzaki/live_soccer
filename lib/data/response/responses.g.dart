// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      get: json['get'] as String?,
      errors: json['errors'] as List<dynamic>?,
      results: json['results'] as int?,
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
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

GetCountriesResponse _$GetCountriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCountriesResponse(
      countries: (json['response'] as List<dynamic>)
          .map((e) => CountryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..get = json['get'] as String?
      ..errors = json['errors'] as List<dynamic>?
      ..results = json['results'] as int?
      ..paging = json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCountriesResponseToJson(
        GetCountriesResponse instance) =>
    <String, dynamic>{
      'get': instance.get,
      'errors': instance.errors,
      'results': instance.results,
      'paging': instance.paging,
      'response': instance.countries,
    };
