import 'package:ask_answers/features/domain/entities/resources.dart';
import 'package:ask_answers/features/presentation/controllers/ask_controller.dart';
import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:ask_answers/features/presentation/pages/pdf_page.dart';
import 'package:ask_answers/features/presentation/pages/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../appbar_component.dart';

class CardsInformationPage extends StatelessWidget {
  static String routeName = "cards_information.page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Información',
      ),
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0XFF283593),
                  const Color(0XFF3F51B5),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Container(), decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/menulateral.jpeg'), fit: BoxFit.contain))),
            ListTile(
              title: Text(
                'Información',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(CardsInformationPage.routeName);
              },
            ),
            GetBuilder<AskController>(
                id: 'buttonCounter',
                init: Get.find<AskController>(),
                initState: (_) async => await Get.find<AskController>().getButtonCounter(),
                builder: (_controller) {
                  if (!_controller.buttonCounter.isNull && _controller.buttonCounter >= 2) {
                    return SizedBox();
                  }
                  return ListTile(
                    title: Text('Cuestionario', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      Get.back();
                      _controller.upButtonCounter();
                      Get.toNamed(FormPage.routeName, arguments: '0');
                    },
                  );
                })
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
              children: resources
                  .map(
                    (el) => InkWell(
                      onTap: () {
                        Get.to(SummaryPage(
                          resource: el,
                        ));
                      },
                      child: Container(
                        height: 100,
                        child: Card(
                          color: Color(0XFF9FA8DA),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(el["image"])),
                                  ),
                                ),
                              ),
                              //leading: Image(image: AssetImage(el["image"])),
                              title: Text(
                                el["name"],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
