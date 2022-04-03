

import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => RegisterController()) ;
  }
}

