import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_soccer/data/models/network_models.dart';
import 'package:live_soccer/data/response/responses.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final x = await rootBundle.loadString('assets/api/test.json');
        //   log(x.toString());
        final map = jsonDecode(x);

        GetCompetitionsResponse c = GetCompetitionsResponse.fromJson(map);

        // GetCountriesResponse r = GetCountriesResponse.fromJson(map);
      }),
    );
  }
}
