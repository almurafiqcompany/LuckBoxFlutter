import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_bloc/database/models/model_two.dart';

class AuthServices {
  static UserRegisterModel? userRegisterModel;

  static String baseApi = 'https://luck-boox.com/api';

  static var client = http.Client();

  static void register(
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
    }).catchError((error) {
      print(error);
    });
    // print('${response} youssssssssef tarek 874874844') ;

    // print('${response.body} youssssssssef tarek 874874844') ;

    // if(response.statusCode == 200) {
    //   var startObjects = response.body;
    //   var user = userFromJson(startObjects) ;
    //   print('${user.message} youssssssssef tarek 874874844') ;
    //   return user ;
    // }else{
    //   return null ;
    // }
  }

  static login({required email, password}) async {
    var response = await client.post(
      Uri.parse('https://luck-boox.com/api/login'),
      //   headers: {'Content-Type ' : 'application/json'} ,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var stringObject = response.body;
      var user = userFromJson(stringObject);
      userRegisterModel = UserRegisterModel.fromJson(response.body as dynamic)
          .status as UserRegisterModel;
      return userRegisterModel.toString();
    }
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