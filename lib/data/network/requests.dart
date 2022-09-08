// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CompetionsRequest {
  int season;
  int? id;
  String? country;
  String? name;
  bool? current;
  String? search;
  CompetionsRequest({
    required this.season,
    this.id,
    this.country,
    this.name,
    this.current,
    this.search,
  });
}

class StandingsRequest extends Equatable {
  final int season;
  final int league;

  const StandingsRequest({required this.season, required this.league});

  @override
  List<Object> get props => [season, league];
}

class MatchesRequest {
  int season;
  int? id;
  List<String>? ids;
  int? league;
  int? team;
  String? live;
  DateTime? date;
  String? status;
  MatchesRequest({
    required this.season,
    this.id,
    this.ids,
    this.league,
    this.team,
    this.live,
    this.date,
    this.status,
  });
}
