import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/database/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_bloc/routes/routes.dart';

class LoginController extends GetxController{
  var isLoading = false.obs ;
  final loginGlobalKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  late TextEditingController
      emailTextEditingController ,
      passwordTextEditingController ;
  String  email = '' , password = '' ;

  @override
  void onInit() {

    emailTextEditingController = TextEditingController() ;
    passwordTextEditingController = TextEditingController() ;

    super.onInit();
  }
  @override
  void dispose() {

    emailTextEditingController.dispose();
    passwordTextEditingController.dispose() ;

    super.dispose();
  }

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return 'This is wrong email' ;
    }else{
      return null ;
    }
  }

  String? validatePassword(String value){
    if(value.isEmpty ||value.length <= 5){
      return 'This is wrong password' ;
    }else{
      return null ;
    }
  }


  doLogin() async {
    bool isValidate = loginGlobalKey.currentState!.validate() ;

    if(isValidate){
      isLoading(true) ;
      try{
        var data = AuthServices.login(
            email:emailTextEditingController.text ,
            password: passwordTextEditingController.text,

        );
        // Get.offAll(
        //     AppRoutes.navigate) ;
        print('${emailTextEditingController.text}666666rrrrrrrr');
        return data ;

        // if(data != null){
        //   await storage.write(key: 'name', value: data.toString()) ;
        //   await storage.write(key: 'name', value: data.toString()) ;
        //   loginGlobalKey.currentState!.save() ;
        //   Get.toNamed(AppRoutes.home) ;
        // }else{
        //   Get.snackbar('Login', 'problem in login' ) ;
        // }
      }finally{
        isLoading(false) ;
      }

    }
  }



}