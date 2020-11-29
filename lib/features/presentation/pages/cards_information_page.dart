import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../appbar_component.dart';

class CardsInformationPage extends StatelessWidget {
  static String routeName = "cards_information.page";

  final List<String> list = [
    "Presentación de técnicas de conducción",
    "Presentación de ética y resolución de",
    "Presentación de Marco Legal",
    "Presentación de adaptación al medio",
    "Presentación de mecánica",
    "Presentación de Anexos"
  ];

  @override
  Widget build(BuildContext context) {
    final res = List.generate(list.length ~/ 2, (i) => [list[2 * i], list[2 * i + 1]]);
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Información',
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
            children: res
                .map(
                  (el) => Row(
                      children: el
                          .map(
                            (e) => Container(
                              width: Get.width * 0.5,
                              child: InkWell(
                                onTap: () {
                                  print('tapped to $e');
                                },
                                child: Card(
                                  color: Color(0XFF9FA8DA),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.album),
                                        title: Text(e),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()),
                )
                .toList()),
      ),
    );
  }
}
