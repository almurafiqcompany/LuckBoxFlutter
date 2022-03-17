import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../model/custom_services.dart';

class SignUpController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  var profileImageBase64;

  String userName = '';

  String userEmail = '';

  String userPhone = '';

  String userPassword = '';

  String userGender = '';

  String userCity = '';

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;

    final bytes = File(profilePicPath.value).readAsBytes();
    profileImageBase64 = base64.encoder;
  }

  void signUpUser(String name, String email, String mobile, String password,
      String gender, String city) {
    if (isProfilePicPathSet.value == false) {
      Get.snackbar('Sign Up Failed', 'Please Select Profile Picture',
          backgroundColor: Color(0xFFEC407A),
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2);
    } else if (isEmailValid(email)) {
      Get.snackbar('Sign Up Failed', 'Email id is not Valid',
          backgroundColor: const Color(0xFFEC407A),
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2);
    } else {
      userName = name;
      userEmail = email;
      userPhone = mobile;
      userPassword = password;
      userGender = gender;
      userCity = city;

      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp('jhbdjdjndjwnk').hasMatch(email);
    return emailValid;
  }

  Future<void> sendUserDataToServer() async {
    Map<String, dynamic> dataBody = {
      CustomServices.profile_image: profileImageBase64,
      CustomServices.user_name: userName,
      CustomServices.user_email: userEmail,
      CustomServices.user_phone: userPhone,
      CustomServices.user_password: userPassword,
      CustomServices.user_gender: userGender,
      CustomServices.user_city: userCity
    };

    var dataToSend = json.encode(dataBody) ;

    var response = await http.post(Uri.parse(CustomServices.signUp_api_url) ,
    body: dataToSend
    ) ;
    print(response.body) ;

    if(response.statusCode == 200){
      Map<String , dynamic > responseData = jsonDecode(response.body) ;

    }
  }
}

