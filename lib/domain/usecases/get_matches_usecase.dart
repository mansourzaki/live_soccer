// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:live_soccer/domain/entities/fixtures.dart';
import 'package:live_soccer/domain/repositories/reposoitory.dart';
import 'package:live_soccer/domain/usecases/base_usecase.dart';

import '../../data/network/failuer.dart';

class GetMatchesUsecase {
  final Respository respository;
  GetMatchesUsecase(
    this.respository,
  );

  Future<Either<Failure, List<FootballMatch>>> execute(
      Map<String, dynamic> map) {
    return respository.getMatches(map);
  }
}
