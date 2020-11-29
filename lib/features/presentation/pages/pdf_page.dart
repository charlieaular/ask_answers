import 'package:ask_answers/features/presentation/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfPage extends StatefulWidget {
  final String name;
  final String pdf;
  PdfPage({@required this.name, @required this.pdf});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  PdfController controller;

  @override
  void initState() {
    controller = PdfController(document: PdfDocument.openAsset(widget.pdf));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: widget.name),
      body: PdfView(
        documentLoader: Center(child: CircularProgressIndicator()),
        pageLoader: Center(child: CircularProgressIndicator()),
        controller: controller,
      ),
    );
  }
}
