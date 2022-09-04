// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:live_soccer/domain/entities/country.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  String? get;
  Map<String, dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  BaseResponse({
    this.get,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
  });

  Map<String, dynamic> toJson() {
    return _$BaseResponseToJson(this);
  }

  factory BaseResponse.fromJson(Map<String, dynamic> map) {
    return _$BaseResponseFromJson(map);
  }
}

@JsonSerializable()
class Paging {
  int? current;
  int? total;
  Paging({
    this.current,
    this.total,
  });

  Map<String, dynamic> toJson() {
    return _$PagingToJson(this);
  }

  factory Paging.fromJson(Map<String, dynamic> map) {
    return _$PagingFromJson(map);
  }
}

@JsonSerializable()
class CountriesResponse extends BaseResponse {
  @JsonKey(name: "response")
  List<CountryResponse> countries;

  CountriesResponse({required this.countries});

  @override
  Map<String, dynamic> toJson() {
    return _$GetCountriesResponseToJson(this);
  }

  factory CountriesResponse.fromJson(Map<String, dynamic> map) {
    return _$GetCountriesResponseFromJson(map);
  }
}

@JsonSerializable()
class CountryResponse extends BaseResponse {
  String name;
  String code;
  String flag;

  CountryResponse({required this.name, required this.code, required this.flag});

  Map<String, dynamic> toJson() {
    return _$CountryResponseToJson(this);
  }

  factory CountryResponse.fromJson(Map<String, dynamic> map) {
    return _$CountryResponseFromJson(map);
  }
}
// @JsonSerializable()
// class CountryResponse extends BaseResponse {
//   String name;
//   String code;
//   String flag;

//   CountryResponse({required this.name, required this.code, required this.flag});

//   Map<String, dynamic> toJson() {
//     return _$CountryResponseToJson(this);
//   }

//   factory CountryResponse.fromJson(Map<String, dynamic> map) {
//     return _$CountryResponseFromJson(map);
//   }
// }

@JsonSerializable()
class LeaguesResponse extends BaseResponse {
  LeagueResponse? league;
  CountryResponse? country;
  LeaguesResponse({
    this.league,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return _$LeaguesResponseToJson(this);
  }

  factory LeaguesResponse.fromJson(Map<String, dynamic> json) {
    return _$LeaguesResponseFromJson(json);
  }
}

@JsonSerializable()
class LeagueResponse {
  int? id;
  String? name;
  String? type;
  String? logo;
  LeagueResponse({
    this.id,
    this.name,
    this.type,
    this.logo,
  });
  Map<String, dynamic> toMap() {
    return _$LeagueResponseToJson(this);
  }

  factory LeagueResponse.fromJson(Map<String, dynamic> json) {
    return _$LeagueResponseFromJson(json);
  }
}
