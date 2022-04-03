import 'package:get/get.dart';


class HomeController extends GetxController{

  int count = 10 ;
  void decrement(){
    if(count <= 0){
      return ;
    }
    count -- ;
    update() ;
  }
@override
  void onInit() {
    print( 'init start') ;
    super.onInit();
  }

  @override
  void onReady() {
    print( 'on ready') ;
    super.onReady();
  }

  @override
  void onClose() {
    print( 'on close') ;
    super.onClose();
  }

}