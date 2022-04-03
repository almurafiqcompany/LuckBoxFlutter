

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/auth_controller.dart';


/*
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color backGro = const Color(0xFFB71C1C) ;
  AuthController authController = Get.find() ;

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
                              const Align(
                                alignment: Alignment.center,
                                child: Text('Youssef Tarek',
                                    style: TextStyle(color: Colors.red)),
                              ),
                              const  SizedBox(
                                height: 10.0,
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ' Since joined 999',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal),
                                ),
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
                              const   Text('Contact info :', style:  TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold ,
                              ),),
                              const   SizedBox(
                                height: 20.0,
                              ),
                              const  Text('Id :', style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold ,
                              )),



                              const SizedBox(
                                height: 30.0,
                              ),
                              const Text('User Name : ', style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold ,
                              )),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text('Email :',style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold ,
                              ) ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text('Phone : ', style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold ,
                              )),

                              const SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(bottom: 20),
                                  child: MaterialButton(
                                    onPressed: () => authController.doLogOut(),
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

 */

class ProfilePage extends GetView <AuthController>{
   ProfilePage({Key? key}) : super(key: key);

  Color backGro = const Color(0xFFB71C1C) ;
  //AuthController authController = Get.find() ;

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
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('Youssef Tarek',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                  const  SizedBox(
                                    height: 10.0,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      ' Since joined 999',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal),
                                    ),
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
                                  const   Text('Contact info :', style:  TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  ),),
                                  const   SizedBox(
                                    height: 20.0,
                                  ),
                                  const  Text('Id :', style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  )),



                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  const Text('User Name : ', style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  )),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text('Email :',style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  ) ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text('Phone : ', style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold ,
                                  )),

                                  const SizedBox(
                                    height: 20.0,
                                  ),
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
