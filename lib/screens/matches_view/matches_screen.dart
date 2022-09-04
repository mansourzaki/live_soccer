import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/domain/usecases/get_countries_usecase.dart';
import 'package:live_soccer/providers/provider.dart';
import 'package:live_soccer/screens/matchs_widgets/league_matches_widget.dart';

class MatchesScreen extends ConsumerStatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MatchesScreenState();
}

class MatchesScreenState extends ConsumerState<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    initCountriesModule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My League'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ref.watch(countriesProvider).when(
            data: (data) {
              return LeagueMatchesWidget(
                countriesList: data,
              );
            },
            error: (error, stackTrace) => Center(child: Text('$error')),
            loading: () => Center(child: Text('Error')),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('in float');
          instance.get<GetCountriesUseCase>().execute();
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
