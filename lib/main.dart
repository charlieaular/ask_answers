import 'package:flutter/material.dart';
import 'features/presentation/app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(App());
}
