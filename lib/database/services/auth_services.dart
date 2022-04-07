import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_bloc/database/models/model_two.dart';
import 'package:test_bloc/routes/routes.dart';

class AuthServices {
  static UserRegisterModel? userRegisterModel;

  static String baseApi = 'https://luck-boox.com/api';

  static var client = http.Client();

  static Future register(
      {required name,
        required email,
        required password,
        required phone,
        required governate}) async {
    var response = await client.post(
      Uri.parse('$baseApi/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'governate': governate,
      },
    ).then((value) {
      print('hamouda');
      Get.offAllNamed(
          AppRoutes.navigate) ;
    }).catchError((error) {
      print(error);
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  //  return response ;
  }

  static Future<void> login({required email,required password}) async {
    var response = await client.post(
      Uri.parse('$baseApi/api/login'),
      body: {

        'email': email,
        'password': password,

      } , ).then((value) {
      print('hamouda');
      Get.offAllNamed(
          AppRoutes.navigate) ;
    }).catchError((error) {
      print(error);
    }) ;
    return response ;


    // if (response.statusCode == 200) {
    //   var stringObject = response.body;
    //   var user = userFromJson(stringObject);
    //   userRegisterModel = UserRegisterModel.fromJson(response.body as dynamic)
    //       .status as UserRegisterModel;
    //   return userRegisterModel.toString();
    // }
  }

}




// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:test_bloc/database/models/user_model.dart';
//
// class AuthServices{
//  static String baseApi = 'https://luck-boox.com/api';
//  static var client = http.Client() ;
//
//   static register({required name,required email,required phone,
//        })async{
//     var response = await client.post(Uri.parse('$baseApi/register') ,
//    // headers: {'Content-Type' : 'application/json'} ,
//     body: jsonEncode(<String , String> {
//       "name" : name ,
//       "email" : email ,
//       "phone" : phone ,
//     })
//     );
//     if(response.statusCode == 200 || response.statusCode == 201){
//       var stringObject = response.body ;
//      // print('${stringObject} ijjjjjjjjjjjjjjjjjjjj') ;
//       var user = userFromJson(stringObject) ;
//       return user ;
//     }
//
//   }
// }