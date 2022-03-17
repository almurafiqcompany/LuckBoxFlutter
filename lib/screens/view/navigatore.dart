import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_bloc/controller/navigation_controller.dart';

import 'home_page.dart';
import 'profil.dart';

class NavigationBottom extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  NavigationBottom({Key? key}) : super(key: key);

  final screens = [
    const HomePage(),
    const ProfilePage(),
  ];

  Color backGro = const Color(0xFFB71C1C) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            bottomNavigationController.changeIndex(index);
          },
          currentIndex: bottomNavigationController.selectedIndex.value,
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
      ),
    );
  }
}
