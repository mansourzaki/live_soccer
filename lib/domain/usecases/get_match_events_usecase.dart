import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:live_soccer/domain/entities/entities.dart';

import '../../data/network/failuer.dart';
import '../repositories/reposoitory.dart';

class GetMatchEventsUsecase {
  final Respository respository;
  GetMatchEventsUsecase(
    this.respository,
  );

  Future<Either<Failure, List<MatchEvent>>> execute(int fixture) {
    log('message');
    return respository.getMatchEvents(fixture);
  }
}
