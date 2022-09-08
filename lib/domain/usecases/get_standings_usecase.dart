import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/domain/entities/entities.dart';

import '../../data/network/failuer.dart';
import '../repositories/reposoitory.dart';

class GetStandingsUsecase {
  final Respository respository;
  GetStandingsUsecase(
    this.respository,
  );

  Future<Either<Failure, List<Standing>>> execute(
      StandingsRequest standingsRequest) {
    log('message in use case');
    return respository.getStandings(
        standingsRequest);
  }
}
