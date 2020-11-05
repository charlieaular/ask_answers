import 'package:ask_answers/features/presentation/controllers/ask_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../injection_container.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "form.page";
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int _radioValue = 1;
  //AskController askController = sl<AskController>();
  @override
  Widget build(BuildContext context) {
    //askController.getAsks();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _toTheNextQuestion(context);
          },
          child: Icon(Icons.arrow_right)),
      body: SafeArea(
          child: Container(
        child: GetBuilder<AskController>(
            init: sl<AskController>(),
            //initState: (_) => askController.getAsks(),
            builder: (_controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text('Esta es la pregunta que vamos a usar'),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('value 1'),
                              Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (int value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                  print(value);
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('value 2'),
                              Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (int value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                  print(value);
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ],
              );
            }),
      )),
    );
  }

  _toTheNextQuestion(context) async {
    String index = Get.arguments;
    int nextIndex = int.parse(index) + 1;
    Navigator.pushReplacementNamed(context, FormPage.routeName,
        arguments: nextIndex.toString());
  }
}
