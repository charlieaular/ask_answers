import 'package:ask_answers/features/presentation/pages/form_page.dart';
import 'package:ask_answers/features/presentation/pages/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../appbar_component.dart';

class CardsInformationPage extends StatelessWidget {
  static String routeName = "cards_information.page";

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> resources = [
      {
        "name": "Presentación de técnicas de conducción",
        "image": "assets/images/tecnicas.jpeg",
        "pdf": "assets/pdfs/TECNICAS_DE_CONDUCCION.pdf"
      },
      {
        "name": "Presentación de ética y resolución de problemas",
        "image": "assets/images/etica.jpeg",
        "pdf": "assets/pdfs/ETICA.pdf"
      },
      {
        "name": "Presentación de Marco Legal",
        "image": "assets/images/marco_legal.jpeg",
        "pdf": "assets/pdfs/MARCO_LEGAL.pdf"
      },
      {
        "name": "Presentación de adaptación al medio",
        "image": "assets/images/adaptacion_al_medio.jpeg",
        "pdf": "assets/pdfs/ADAPTACION_AL_MEDIO.pdf"
      },
      {
        "name": "Presentación de mecánica",
        "image": "assets/images/mecanica.jpeg",
        "pdf": "assets/pdfs/MECANICA_BASICA.pdf"
      },
      {
        "name": "Presentación de Anexos",
        "image": "assets/images/anexos.jpeg",
        "pdf": "assets/pdfs/ANEXOS.pdf"
      },
    ];

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
            DrawerHeader(
                child: Container(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/menulateral.jpeg'),
                        fit: BoxFit.contain))),
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
              title: Text('Cuestionario',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              onTap: () {
                Get.back();
                Get.toNamed(FormPage.routeName, arguments: '0');
              },
            )
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
                        Get.to(PdfPage(name: el["name"], pdf: el["pdf"]));
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
                                    image: DecorationImage(
                                        image: AssetImage(el["image"])),
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
