import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controller_binder.dart';
import 'package:notification_panel/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home: const HomePage(),
    );
  }
}
