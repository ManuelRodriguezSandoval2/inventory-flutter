import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes(),
      initialRoute: '/home',
    );
  }
}
