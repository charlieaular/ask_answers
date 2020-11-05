import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home.page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Text('Drawer header')),
          ListTile(
            title: buildPopUpButton(),
          ),
          ListTile(
            title: Text('Cuestionario'),
            onTap: () {
              Get.back();
              Get.toNamed(FormPage.routeName, arguments: '0');
            },
          )
        ],
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
