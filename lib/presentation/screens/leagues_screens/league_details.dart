import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_soccer/domain/entities/entities.dart';
import 'package:live_soccer/presentation/screens/matches/matches_view/tabel_view.dart';

class LeagueetailsScreen extends StatelessWidget {
  const LeagueetailsScreen({Key? key, required this.league}) : super(key: key);
  final League league;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            color: Color.fromARGB(210, 30, 29, 29),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.network(
                        league.logo,
                        width: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            league.name,
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            league.country!,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(130)),
      body: TabelView(league: league),
    );
  }
}
