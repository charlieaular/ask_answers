import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:ask_answers/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ask Answer app",
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(name: HomePage.routeName, page: () => HomePage()),
        GetPage(name: FormPage.routeName, page: () => FormPage())
      ],
    );
  }
}
