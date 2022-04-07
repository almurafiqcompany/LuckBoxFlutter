import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_bloc/routes/routes.dart';

import '../../database/models/model_two.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{
  var storage = const FlutterSecureStorage() ;
  var name = ''.obs ;
  var token = '' ;

  static UserRegisterModel? userRegisterModel;



  static String baseApi = 'https://luck-boox.com/api';

  static var client = http.Client();
  var isLoading = true.obs;
  @override
  void onInit(){
    authData() ;
    super.onInit() ;
  }

  authData()async {
    name.value = (await storage.read(key: 'name')).toString() ;
    token = (await storage.read(key: 'token')).toString()  ;
  }



  bool isAuth(){
    return token.isNotEmpty;
  }

   Future<void> getData(
      {required name,
        required email,
        required phone,
        required governate}) async {
    var response = await client.get(
      Uri.parse('$baseApi/users'),

    ).then((value) {
      print('hamouda');
      Get.offAllNamed(
          AppRoutes.navigate) ;
    }).catchError((error) {
      print(error);
    });
    name.value = (await storage.read(key: 'name')).toString() ;
    email = storage.read(key: 'email').toString() ;
    phone = storage.read(key: 'phone').toString() ;
    return response ;
  }

  doLogOut() async {
    await storage.deleteAll() ;
    Get.toNamed(AppRoutes.login) ;
  }

}