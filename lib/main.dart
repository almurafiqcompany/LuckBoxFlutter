import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'controller/gender_selection_controller.dart';
import 'screens/view/intro_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  GenderSelectedController genderSelectedController =
  Get.put(GenderSelectedController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),

    );
  }
}
