import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../domain/entities/entities.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key, required}) : super(key: key);
  //final Team team;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Following Screen')),
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
        //  TeamContainer(),
        ],
      ),
    );
  }
}

class TeamContainer extends StatelessWidget {
  TeamContainer({
    Key? key,
  }) : super(key: key);
//  final Team team;
  List<Color> colors = [Colors.red, Colors.pink, Colors.blue];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors[Random().nextInt(2)],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Image.network(
            //   team.logo,
            //   width: 20,
            // ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Arsenal',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
