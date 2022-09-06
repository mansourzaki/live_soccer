import 'dart:developer';
import 'dart:ui';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as img;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/providers/provider.dart';

class LeaguesScreen extends ConsumerWidget {
  LeaguesScreen({Key? key}) : super(key: key);
  final List<Competion> competions = [];
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Leagues'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          // ref.read(leaguesProvider).whenData((value) {
          //   print(value);
          // });
          // print('presses');
        }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildFollowingWidget(),
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 27, 26, 26),
                  ),
                  child: ref.watch(leaguesProvider).when(
                      data: (data) {
                        List<Country> countries =
                            data.map((e) => e.country).toSet().toList();
                        countries.sort((a, b) => a.name.compareTo(b.name));

                        return AllLeaguesWidget(
                          countries: countries,
                          competions: data,
                        );
                      },
                      error: (error, stackTrace) => Center(
                              child: Text(
                            '$error',
                            style: const TextStyle(color: Colors.white),
                          )),
                      loading: () => const SizedBox(
                          height: 500,
                          child: Center(child: CircularProgressIndicator())))),
            ],
          ),
        ));
  }

  Container _buildFollowingWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 27, 26, 26),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Following',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Edit',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const FollowingHeader(),
          const SizedBox(
            height: 15,
          ),
          const FollowingHeader(),
          const SizedBox(
            height: 15,
          ),
          const FollowingHeader(),
        ],
      ),
    );
  }
}

class AllLeaguesWidget extends StatelessWidget {
  const AllLeaguesWidget(
      {Key? key, required this.countries, required this.competions})
      : super(key: key);
  final List<Country> countries;
  final List<Competion> competions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: countries.length,
      itemBuilder: (context, index) => ExpansionLeagueTile(
        country: countries[index],
        competions: competions
            .where((element) => element.country == countries[index])
            .toList(),
      ),
    );
  }
}

class ExpansionLeagueTile extends StatelessWidget {
  const ExpansionLeagueTile(
      {Key? key, required this.country, required this.competions})
      : super(key: key);
  final Country country;
  final List<Competion> competions;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: LeagueHeaderWidget(
          country: country,
        ),
        children: List<Widget>.generate(
            competions.length,
            (i) => LeagueRowWidget(
                  competion: competions[i],
                )));
  }
}

class LeagueRowWidget extends StatelessWidget {
  const LeagueRowWidget({Key? key, required this.competion}) : super(key: key);
  final Competion competion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CachedNetworkImage(
              imageUrl: competion.league.logo,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            competion.league.name,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 25,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(68, 1, 1, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
              child: const Text(
                'Follow',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LeagueHeaderWidget extends StatelessWidget {
  const LeagueHeaderWidget({Key? key, required this.country}) : super(key: key);
  final Country country;
  //Competion? competion;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: 10,
        backgroundImage: img.Svg(country.flag,
            source: img.SvgSource.network, scale: 15, size: Size(25, 20)),
      ),
      SizedBox(
        width: 12,
      ),
      Text(
        country.name,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ]);
  }
}

class FollowingHeader extends StatelessWidget {
  const FollowingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Icon(
        Icons.sports_soccer,
        color: Colors.white,
      ),
      SizedBox(
        width: 15,
      ),
      Text(
        'Champions League',
        style: TextStyle(color: Colors.white),
      ),
    ]);
  }
}
