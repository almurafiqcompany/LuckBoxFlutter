import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/database/models/model_two.dart';
import 'package:test_bloc/database/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  final registerGlobalKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  late TextEditingController fullNameTextEditingController;

  late TextEditingController emailTextEditingController;

  late TextEditingController passwordTextEditingController;

  late TextEditingController phoneTextEditingController;

  late TextEditingController governateTextEditingController;

  String name = '', email = '', password = '', phone = '', governate = '';

  @override
  void onInit() {
    fullNameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    governateTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    phoneTextEditingController.dispose();
    governateTextEditingController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'This is wrong email';
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length <= 5) {
      return 'This is wrong password';
    } else {
      return null;
    }
  }

  Future doRegister() async {
    //bool isValidate = registerGlobalKey.currentState!.validate();

    // if (isValidate) {
    //   isLoading(true);
    //   try {
    var data = AuthServices.register(
        name: fullNameTextEditingController.text,
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
        phone: phoneTextEditingController.text,
        governate: governateTextEditingController.text);

    // if (data != null) {
    //   await storage.write(key: 'user', value: data.toString());
    //   await storage.write(key: 'token', value: data.toString());
    //   registerGlobalKey.currentState!.save();
    // } else {
    //   Get.snackbar('register', 'problem in  register');
    // }

    //   print('${fullNameTextEditingController.text} 33') ;

    // await  storage.write(key: 'name', value: data.toString()) ;
    // print('${fullNameTextEditingController.text}22111111111') ;
    // await  storage.write(key: 'token', value: data.toString()) ;
    // print('${fullNameTextEditingController.text}2555555555552') ;

    // } finally {
    //   isLoading(false);
    //   print('${fullNameTextEditingController.text}666666');
    // }
  }
}
