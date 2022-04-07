import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/auth_controller.dart';
import 'package:test_bloc/routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  AuthController authController = Get.find() ;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5) , (){
      if(authController.isAuth()) {
        Get.offAndToNamed(AppRoutes.navigate);
      }else{
        Get.toNamed(AppRoutes.register);

      }
    }) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: Text(
              'App is Loading',
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        )
    );
  }
}

