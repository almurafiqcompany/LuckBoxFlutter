import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_bloc/routes/routes.dart';


class AuthController extends GetxController{
  var storage = const FlutterSecureStorage() ;
  var name = ''.obs ;
  var token = '' ;

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

  doLogOut() async {
    await storage.deleteAll() ;
    Get.toNamed(AppRoutes.login) ;
  }

}