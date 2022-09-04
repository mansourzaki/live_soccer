// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Country {
  String name;
  String code;
  String flag;

  Country({required this.name, required this.code, required this.flag});
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'flag': flag,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] as String,
      code: map['code'] as String,
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source) as Map<String, dynamic>);
}
