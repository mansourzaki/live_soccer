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
      ..parameters = json['parameters'] as List<dynamic>?
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
