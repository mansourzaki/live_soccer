import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/data/network/app_service.dart';
import 'package:live_soccer/data/network/failuer.dart';
import 'package:live_soccer/domain/entities/country.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/domain/usecases/get_leagues_usecase.dart';
import 'package:live_soccer/domain/usecases/get_match_events_usecase.dart';
import 'package:live_soccer/domain/usecases/get_matches_usecase.dart';
import 'package:live_soccer/domain/usecases/get_standings_usecase.dart';

import '../data/network/requests.dart';

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

final matcheEventUsecaseProvider = Provider<GetMatchEventsUsecase>(
  (ref) {
    return instance.get<GetMatchEventsUsecase>();
  },
);

final standingsUsecaseProvider = Provider<GetStandingsUsecase>(
  (ref) {
    return instance.get<GetStandingsUsecase>();
  },
);

final searchProvider = StateProvider((ref) => '');

final matchesProvider =
    StateNotifierProvider<MachesNotifier, List<FootballMatch>>(
  (ref) => MachesNotifier(),
);

class MachesNotifier extends StateNotifier<List<FootballMatch>> {
  MachesNotifier() : super([]);
  List<FootballMatch> filterdList = [];
  void fetchMatches(Map<String, dynamic> m) async {
    //  state.clear();
    final result = await instance.get<GetMatchesUsecase>().execute(m);
    state = result.fold((l) => <FootballMatch>[], (r) => <FootballMatch>[...r]);
    print(result.toString() + 'sss');
  }

  void searchFor(String chars) {
    filterdList = state
        .where((element) =>
            element.league.name.contains(chars) ||
            element.league.country!.contains(chars))
        .toList();
  }

  void updateLive() async {
    state.where((element) => element.fixture.status.elapsed > 0).forEach((e) {
      e.fixture.status.elapsed++;
    });
  }

  void getTomorrow() {}
  void getSpecficData(String date) {
    state.where((element) => element.fixture.date == date);
  }
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

final matchesFutureProvider = FutureProvider.autoDispose
    .family<List<FootballMatch>, Map<String, dynamic>>(
  (ref, map) async {
    final usecase = ref.watch(matchesUsecaseProvider);

    final matches = await usecase.execute(map);
    ref.maintainState = true;

    return matches.fold((l) => <FootballMatch>[], (r) => <FootballMatch>[...r]);
  },
);

final matcheEventsFutureProvider =
    FutureProvider.autoDispose.family<List<MatchEvent>, int>(
  (ref, id) async {
    final usecase = ref.watch(matcheEventUsecaseProvider);
    log('exec1');
    final matches = await usecase.execute(id);

    log('exec2');

    return matches.fold((l) => <MatchEvent>[], (r) => <MatchEvent>[...r]);
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

final standingsProvider =
    FutureProvider.family<List<Standing>, StandingsRequest>(
  (ref, request) async {
    print('in riverpod');
    final usecase = ref.watch(standingsUsecaseProvider);

    final leagues = await usecase.execute(request);
    //   ref.maintainState = true;
    return leagues.fold((l) => [], (r) => [...r]);
  },
);
