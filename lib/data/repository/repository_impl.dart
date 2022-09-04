import 'dart:developer';

import 'package:live_soccer/data/data_source/remote_data_source.dart';
import 'package:live_soccer/data/mappers/mapper.dart';
import 'package:live_soccer/data/network/network_info.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/data/network/requests.dart';
import 'package:live_soccer/data/network/failuer.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/reposoitory.dart';

class RepositoryImpl implements Respository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<Country>>> getCountries() async {
    if (await _networkInfo.isConnected) {
      log('before print response');
      final response = await _remoteDataSource.getCountries();
      log('after print response');
      print(response);
      return Right(response.toDomain());
    } else {
      return Left(Failure(error: 'fff', code: 500));
    }
  }
}
