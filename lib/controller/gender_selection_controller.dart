import 'package:get/get.dart';

class GenderSelectedController extends GetxController{
  var selectedGender = ''.obs ;

  onChangeGender(var gender){
    selectedGender.value = gender ;
    update() ;
  }



}