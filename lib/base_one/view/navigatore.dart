import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/navigation_controller.dart';

import 'package:test_bloc/base_one/view/home_page.dart';
import 'package:test_bloc/base_one/view/profil.dart';
import 'package:test_bloc/logic/controllers/ads_controller.dart';

class NavigationBottom extends GetWidget <BottomNavigationController>{

  NavigationBottom({Key? key}) : super(key: key);



  final screens = [
    HomePage(),
      ProfilePage(),

  ];

  Color backGro = const Color(0xFFB71C1C) ;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
    builder: ((controller) =>Scaffold(
      // backgroundColor: Colors.white,
      body: IndexedStack(
        index: controller.navigatorValue,
        children: screens,
      ),

      bottomNavigationBar: bottomNavigationBar()
      /*
      BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          controller.navigatorValue;
        },
        currentIndex: controller.navigatorValue,
        items:  [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: 'Home',
              backgroundColor: backGro),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
              backgroundColor: backGro),
        ],
      ),

       */
    )
    )) ;
  }

Widget  bottomNavigationBar() {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
        builder: (controller) => BottomNavigationBar(
          items:  [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                label: 'Home',
                backgroundColor: backGro),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profile',
                backgroundColor: backGro),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) => controller.changeSelectedValue(index) ,
           type: BottomNavigationBarType.shifting,
           selectedItemColor: Colors.white,
           unselectedItemColor: Colors.white38,
           elevation: 0,
           showSelectedLabels: true,
           showUnselectedLabels: false,
        )
    ) ;
}

}
