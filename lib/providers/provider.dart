import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/network/failuer.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/domain/usecases/get_leagues_usecase.dart';
import 'package:live_soccer/domain/usecases/get_matches_usecase.dart';

final countrisUsecaseProvider = Provider<GetCountriesUseCase>(
  (ref) {
    return instance.get<GetCountriesUseCase>();
  },
);

final matchesUsecaseProvider = Provider<GetMatchesUsecase>(
  (ref) {
    return instance.get<GetMatchesUsecase>();
  },
);

final matchesProvider =
    StateNotifierProvider<MachesProvider, List<FootballMatch>>(
  (ref) => MachesProvider(),
);

class MachesProvider extends StateNotifier<List<FootballMatch>> {
  MachesProvider() : super([]);

  void getToday() async {
    state = [...state];
  }

  void getTomorrow() {}
  void getSpecficData(String date) {}
}

// final countriesProvider = Provider<List<Country>>(
//   (ref) {
//     return _countries;
//   },
// );

final competionsUsecaseProvider = Provider<GetCompetionsUseCase>(
  (ref) {
    return instance.get<GetCompetionsUseCase>();
  },
);

final countriesProvider = FutureProvider.autoDispose(
  (ref) async {
    final usecase = ref.watch(countrisUsecaseProvider);

    final countris = await usecase.execute();
    ref.maintainState = true;

    return countris.fold((l) => <Country>[], (r) => <Country>[...r]);
  },
);

final matchesFutureProvider = FutureProvider.autoDispose(
  (ref) async {
    final usecase = ref.watch(matchesUsecaseProvider);

    final countris =
        await usecase.execute({'season': 2022, 'date': '2022-09-06'});
    ref.maintainState = true;

    return countris.fold(
        (l) => <FootballMatch>[], (r) => <FootballMatch>[...r]);
  },
);

final leaguesProvider = FutureProvider.autoDispose(
  (ref) async {
    final usecase = ref.watch(competionsUsecaseProvider);

    final leagues = await usecase
        .execute(GetCompetionsUseCaseInput(2022, {'current': true}));
    ref.maintainState = true;
    return leagues.fold((l) => <Competion>[], (r) => <Competion>[...r]);
  },
);
