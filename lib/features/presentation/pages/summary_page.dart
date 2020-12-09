import 'package:ask_answers/features/presentation/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pdf_page.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, dynamic> resource;
  const SummaryPage({Key key, @required this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.to(PdfPage(name: resource["name"], pdf: resource["pdf"])),
        child: Icon(Icons.picture_as_pdf_rounded),
        backgroundColor: Color(0XFF3F51B5), //flotantes
      ),
      appBar: AppBarComponent(
        title: resource['name'],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Center(
                child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                resource['summary'],
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ))),
      ),
    );
  }
}
