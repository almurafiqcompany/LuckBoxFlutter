import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:test_bloc/base_one/view/navigatore.dart';
import 'package:test_bloc/base_one/view/profil.dart';
import 'package:test_bloc/controller/gender_selection_controller.dart';
import 'package:test_bloc/routes/routes.dart';

import 'base_one/view/home_page.dart';
import 'base_one/view/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GenderSelectedController genderSelectedController =
      Get.put(GenderSelectedController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LuckBox',
      getPages: AppRoutes.routes,
     // initialRoute: AppRoutes.profile ,
      debugShowCheckedModeBanner: false,
      home:  IntroPage(),
    );
  }
}
