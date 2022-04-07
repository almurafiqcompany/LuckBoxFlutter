
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_bloc/logic/controllers/register_controller.dart';
import '../../logic/controllers/auth_controller.dart';

class ProfilePage extends GetView <AuthController>{
  ProfilePage({Key? key}) : super(key: key);

  Color backGro = const Color(0xFFB71C1C) ;

RegisterController registerController = Get.put(RegisterController()) ;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size ;
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) =>Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backGro,
            title:  const Center(
              child: Text('Profile' ,  style: TextStyle(
                color: Colors.white,
                fontSize: 29,
              ),),
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: Stack(
                      children: [
                        Card(
                            margin: const EdgeInsets.all(30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const SizedBox(
                                    height: 80.0,
                                  ),
                                   Align(
                                    alignment: Alignment.center,
                                    child: Text('${controller.name}',
                                        style: const TextStyle(color: Colors.red , fontStyle: FontStyle.italic,)),
                                  ),
                                  const  SizedBox(
                                    height: 10.0,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  const   SizedBox(
                                    height: 15.0,
                                  ),
                                  const  Center(
                                    child:  Text('Contact info ', style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold ,
                                    ),),
                                  ),
                                  const   SizedBox(
                                    height: 20.0,
                                  ),

                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                   Text('User Name : '
                                       '${registerController.fullNameTextEditingController.text}', style: const TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  )),
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  // const Text('Email :',style: TextStyle(
                                  //   color: Colors.black,
                                  //   fontStyle: FontStyle.italic,
                                  //   fontSize: 15,
                                  //   fontWeight: FontWeight.bold ,
                                  // ) ),
                                  // const SizedBox(
                                  //   height: 20.0,
                                  // ),
                                  // const Text('Phone : ', style: TextStyle(
                                  //   color: Colors.black,
                                  //   fontSize: 15,
                                  //   fontStyle: FontStyle.italic,
                                  //   fontWeight: FontWeight.bold ,
                                  // )),
                                  //
                                  // const SizedBox(
                                  //   height: 20.0,
                                  // ),
                                  Center(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => controller.doLogOut(),
                                        // onPressed: (){},
                                        color: backGro,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                            side: BorderSide.none),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Icon(
                                              Icons.logout,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 14),
                                              child: Text('Logout',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Positioned(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.26,
                                  height: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 10,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/red.JPG',
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            ))

                      ],
                    ),
                  ))),)
    );
  }
}