

import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/auth_controller.dart';


class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController()) ;
  }
}

