import 'package:ask_answers/features/presentation/controllers/ask_controller.dart';
import 'package:ask_answers/features/presentation/pages/cards_information_page.dart';
import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:ask_answers/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../injection_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AskController(useCase: sl()));
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0XFF3F51B5)),
      debugShowCheckedModeBanner: false,
      title: "Ask Answer app",
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(name: HomePage.routeName, page: () => HomePage()),
        GetPage(name: CardsInformationPage.routeName, page: () => CardsInformationPage()),
        GetPage(name: FormPage.routeName, page: () => FormPage())
      ],
    );
  }
}
