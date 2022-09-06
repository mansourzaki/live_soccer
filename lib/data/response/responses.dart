// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:live_soccer/domain/entities/country.dart';

import '../models/network_models.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  String? get;

  List<dynamic>? errors;
  int? results;
  Paging? paging;
  BaseResponse({
    this.get,
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
class GetCountriesResponse extends BaseResponse {
  @JsonKey(name: "response")
  List<CountryResponse> countries;

  GetCountriesResponse({required this.countries});

  @override
  Map<String, dynamic> toJson() {
    return _$GetCountriesResponseToJson(this);
  }

  factory GetCountriesResponse.fromJson(Map<String, dynamic> map) {
    return _$GetCountriesResponseFromJson(map);
  }
}
