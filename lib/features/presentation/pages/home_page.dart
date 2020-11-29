import 'package:ask_answers/features/presentation/appbar_component.dart';
import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'cards_information_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home.page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
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
            DrawerHeader(child: Container(), decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/app_icon2.png'), fit: BoxFit.cover))),
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
            ListTile(
              title: Text('Cuestionario', style: TextStyle(color: Colors.white, fontSize: 18)),
              onTap: () {
                Get.back();
                Get.toNamed(FormPage.routeName, arguments: '0');
              },
            )
          ],
        ),
      )),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('inicio del home page'),
          ),
        ),
      ),
    );
  }

  Widget buildPopUpButton() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: Text('uno'),
        ),
        PopupMenuItem(child: Text('dos')),
        PopupMenuItem(child: Text('tres')),
      ],
      child: Text('Información'),
    );
  }
}
