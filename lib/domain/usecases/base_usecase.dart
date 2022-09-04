import 'package:dartz/dartz.dart';
import 'package:live_soccer/data/network/failuer.dart';

abstract class BaseUseCase<In,Out>{
  Future<Either<Failure,Out>> execute(In input);
}