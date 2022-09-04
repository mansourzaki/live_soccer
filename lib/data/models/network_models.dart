import 'package:json_annotation/json_annotation.dart';

import '../response/responses.dart';
part 'network_models.g.dart';
@JsonSerializable()
class CountryResponse extends BaseResponse {
  String? name;
  String? code;
  String? flag;

  CountryResponse({required this.name, required this.code, required this.flag});

  Map<String, dynamic> toJson() {
    return _$CountryResponseToJson(this);
  }

  factory CountryResponse.fromJson(Map<String, dynamic> map) {
    return _$CountryResponseFromJson(map);
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