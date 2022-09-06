import 'package:dartz/dartz.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/domain/usecases/base_usecase.dart';

import '../../data/network/failuer.dart';
import '../repositories/reposoitory.dart';

class GetCompetionsUseCase
    implements BaseUseCase<GetCompetionsUseCaseInput, List<Competion>> {
  final Respository _respository;
  GetCompetionsUseCase(
    this._respository,
  );

  @override
  Future<Either<Failure, List<Competion>>> execute(GetCompetionsUseCaseInput input) {
    print('in execute');
    return _respository.getCompetions(
        CompetionsRequest(season: input.season), input.map);
  }
}

class GetCompetionsUseCaseInput {
  int season;
  Map<String, dynamic> map;

  GetCompetionsUseCaseInput(this.season, this.map);
}
