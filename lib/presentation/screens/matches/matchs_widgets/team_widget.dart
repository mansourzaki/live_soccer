import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TeamNameWidget extends StatelessWidget {
  const TeamNameWidget(
      {Key? key, required this.image, required this.name,})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Image.network(
                image,
                width: 50,
              ),
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 14),
        )
      ],
    );
  }
}
