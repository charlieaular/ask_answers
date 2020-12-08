import 'package:ask_answers/features/presentation/controllers/ask_controller.dart';
import 'package:ask_answers/features/presentation/pages/cards_information_page.dart';
import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../injection_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(sl<AskController>());
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0XFFFFEE58)), //fondo
      debugShowCheckedModeBanner: false,
      title: "Ask Answer app",
      initialRoute: CardsInformationPage.routeName,
      getPages: [
        GetPage(
            name: CardsInformationPage.routeName,
            page: () => CardsInformationPage()),
        GetPage(name: FormPage.routeName, page: () => FormPage())
      ],
    );
  }
}
