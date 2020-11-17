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
  AskController askController = Get.find<AskController>();
  Size size = MediaQuery.of(Get.context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            askController.nextPage(_radioValue);
            // _toTheNextQuestion(context);
          },
          child: Icon(Icons.arrow_right)),
      body: SafeArea(
          child: Container(
        child: GetBuilder<AskController>(
            initState: (_) => askController.getAsks(),
            init: askController,
            id: 'asks',
            builder: (_controller) {
              if (_controller.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: Text(
                      _controller.currentItem.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: _controller.currentItem.answers.map((e) {
                          return Row(
                            children: [
                              Radio(
                                value: _controller.currentItem.answers.indexOf(e),
                                groupValue: _radioValue,
                                onChanged: (int value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                  print(value);
                                },
                              ),
                              Flexible(
                                child: Text(
                                  e.name,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      )),
                ],
              );
            }),
      )),
    );
  }

  _toTheNextQuestion(context) async {
    Navigator.pushReplacementNamed(
      context,
      FormPage.routeName,
    );
  }
}
