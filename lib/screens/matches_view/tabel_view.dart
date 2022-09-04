import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_soccer/presentation/resourcing/color_manager.dart';

class TabelView extends StatefulWidget {
  const TabelView({Key? key}) : super(key: key);

  @override
  State<TabelView> createState() => _TabelViewState();
}

class _TabelViewState extends State<TabelView> {
  String espa =
      'https://upload.wikimedia.org/wikipedia/en/thumb/d/d6/Rcd_espanyol_logo.svg/1200px-Rcd_espanyol_logo.svg.png';
  String bar =
      'https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png';
  String rma =
      'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png';
  @override
  Widget build(BuildContext context) {
    return DataTable(
        dataRowColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return Colors.yellow;
            } else {
              return null;
            }
          },
        ),
        columnSpacing: 15,
        dataTextStyle:
            TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
        headingTextStyle: TextStyle(color: ColorManager.grey2),
        columns: [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Team')),
          DataColumn(label: Text('PL')),
          DataColumn(label: Text('W')),
          DataColumn(label: Text('D')),
          DataColumn(label: Text('L')),
          DataColumn(label: Text('+/-')),
          DataColumn(label: Text('GD')),
          DataColumn(label: Text('PTS')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(
              color:
                  MaterialStateProperty.all(Color.fromARGB(255, 121, 123, 121)),
              cells: [
                DataCell(Text('2')),
                DataCell(Text.rich(TextSpan(children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Image.network(
                        rma,
                        width: 16,
                      )),
                  TextSpan(text: '  Real Madrid'),
                ]))),
                DataCell(Text('3')),
                DataCell(Text('3')),
                DataCell(Text('0')),
                DataCell(Text('0')),
                DataCell(Text('9-3')),
                DataCell(Text('6')),
                DataCell(Text('9')),
              ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    espa,
                    width: 16,
                  )),
              TextSpan(text: '  Espaneol'),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text.rich(TextSpan(children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Image.network(
                    bar,
                    width: 16,
                  )),
              TextSpan(text: '  Fc Barcelona  '),
            ]))),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('0')),
            DataCell(Text('0')),
            DataCell(Text('9-3')),
            DataCell(Text('6')),
            DataCell(Text('9')),
          ]),
        ]);
  }
}
