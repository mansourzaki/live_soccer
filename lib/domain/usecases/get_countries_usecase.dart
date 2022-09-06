// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:live_soccer/data/network/failuer.dart';
import 'package:live_soccer/domain/repositories/reposoitory.dart';

class GetCountriesUseCase {
  final Respository _respository;
  GetCountriesUseCase(
    this._respository,
  );

  Future<Either<Failure, List<dynamic>>> execute() {
    print('in execute');
    return _respository.getCountries();
  }
}
