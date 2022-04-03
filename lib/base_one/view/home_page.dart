import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_bloc/routes/routes.dart';
import '../../logic/controllers/ads_controller.dart';
import '../../logic/controllers/home_controller.dart';
import 'game.dart';

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backGro = const Color(0xFFB71C1C);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerPage>(
        init: HomeControllerPage(),
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
       elevation: 0,
        backgroundColor: backGro,
        title: const Center(
          child: Text(
            'LuckBox',
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
            ),
          ),
        ),
      ),
      body: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                     const Center(child:  Text(
                       'Hello Youssef',
                       style: TextStyle(
                           fontWeight: FontWeight.bold, fontSize: 35),
                     ) ,) ,
                      const SizedBox(
                        height: 50,
                      ),
                      Row( children: const [

                      ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Row(
                          children: const [
                            Icon(Icons.favorite_outline , color: Colors.red , size: 25),
                            SizedBox(
                              width: 20,
                            ),
                            Text(' 8 '),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.favorite_outline , color: Colors.red, size: 25,),
                            SizedBox(
                              width: 20,
                            ),
                            Text(' 8 '),
                          ],
                        ),
                      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
                    ],
                  ),
                ),
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton(
        onPressed: () {
          Get.to(() => const Game());
          print("object");
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.7,
            45,
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    )));
  }
}


 */

class HomePage extends GetWidget<HomeControllerPage> {
  HomePage({Key? key}) : super(key: key);

  Color backGro = const Color(0xFFB71C1C);

  int x = 0;
  bool y = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerPage>(
        init: HomeControllerPage(),
        builder: ((controller) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: backGro,
              title: const Center(
                child: Text(
                  'LuckBox',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Hello Youssef',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                        children: const [],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_outline,
                              color: Colors.red, size: 25),
                          const SizedBox(
                            width: 20,
                          ),
                          // Text(' 8 '),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                color: backGro,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(controller.count.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                color: backGro,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              controller.credit.toString(),
                              //'Get Started',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Row(
                        children: const [
                          Text(
                            ' Number of\n Games',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Coins',
                            //'Get Started',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                  ],
                ),
              ),
            ),

/*

            floatingActionButton: controller.count == x ? FloatingActionButton(
              backgroundColor: Colors.grey,
              elevation: 0.0,
              onPressed: (){
                Get.offNamed((AppRoutes.navigate)) ;
                print("Back to Home page");
              } ,
              child: const Text('Exit' , style: TextStyle(color: Colors.black),
              ),

            ):FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {

              },
              child:  const Text('Start game' ,  style: TextStyle(color: Colors.black))

            )


 */

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: controller.count == x? TextButton(

              onPressed: () {
                print('you cant going to the game') ;
              },
              style: TextButton.styleFrom(
                elevation: 0,
                primary: Colors.red,
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  45,
                ),
              ),
              child: const Text(
                //controller.credit.toString(),
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )   :
            TextButton(
              onPressed: () {
               // controller.showRewardedAd();
                controller.decrement();
                y = false;
                Get.to(
                  () => Game(),
                );
                print("object");
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  45,
                ),
              ),
              child: const Text(

                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )




        )));
  }
}
