import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/network/failuer.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';

final countrisUsecaseProvider = Provider<GetCountriesUseCase>(
  (ref) {
    return instance.get<GetCountriesUseCase>();
  },
);

final countriesProvider = FutureProvider.autoDispose(
  (ref) async {
    final _usecase = ref.watch(countrisUsecaseProvider);

    final countris = await _usecase.execute();

    return countris.fold((l) => <Country>[], (r) => <Country>[...r]);
  },
);
