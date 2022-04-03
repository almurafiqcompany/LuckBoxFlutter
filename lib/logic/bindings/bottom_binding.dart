
import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/navigation_controller.dart';
import 'package:test_bloc/logic/controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class BottomBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController()) ;

  }


}