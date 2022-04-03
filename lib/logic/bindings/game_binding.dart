import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/navigation_controller.dart';


class GameBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController()) ;

  }


}