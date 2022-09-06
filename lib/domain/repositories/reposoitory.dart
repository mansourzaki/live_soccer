import 'package:dartz/dartz.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/domain/entities/entities.dart';

import '../../data/network/failuer.dart';

abstract class Respository {
  Future<Either<Failure, List<Country>>> getCountries();
  Future<Either<Failure, List<Competion>>> getCompetions(
      CompetionsRequest competionsRequest, Map<String, dynamic> map);

  Future<Either<Failure, List<FootballMatch>>> getMatches(Map<String, dynamic> map);
}
