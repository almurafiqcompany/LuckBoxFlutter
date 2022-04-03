import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../base_one/view/home_page.dart';
import '../../base_one/view/profil.dart';
class BottomNavigationController extends GetxController {


  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomePage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomePage();
          break;
        }
      case 1:
        {
          currentScreen = ProfilePage();
          break;
        }

    }
    update();
  }

}
