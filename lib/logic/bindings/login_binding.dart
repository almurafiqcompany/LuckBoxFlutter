
import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController()) ;
    Get.put(AuthController()) ;
  }


}