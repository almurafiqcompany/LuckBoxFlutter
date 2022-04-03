import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'navigatore.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        padding: const EdgeInsets.only(
          top: 10,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/red.JPG'),
          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton(

        onPressed: () {
          Get.offAll(() =>  NavigationBottom()); //SignUpScreen() ); // //  //
         print("object") ;
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.7,
            45,
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}