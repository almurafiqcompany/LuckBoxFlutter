
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../logic/controllers/game_controller.dart';
import '../../routes/routes.dart';

class GamePag extends GetWidget {
   GamePag({Key? key}) : super(key: key);

  bool x = true ;

   @override
  GameController controller = Get.find() ;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
        init: GameController(),
    builder: (controller) =>Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (controller.direction != Direction.up && details.delta.dy > 0) {
                controller.direction = Direction.down;
              }
              if (controller.direction != Direction.down && details.delta.dy < 0) {
                controller.direction = Direction.up;
              }
            },
            onHorizontalDragUpdate: (details) {
              if (controller.direction != Direction.left && details.delta.dx > 0) {
                controller.direction = Direction.right;
              }
              if (controller.direction != Direction.right && details.delta.dx < 0) {
                controller.direction = Direction.left;
              }
            },
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 760,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 20),
              itemBuilder: (context, index) {
                if (controller.snakePosition.contains(index)) {
                  return Container(
                    color: Colors.black,
                  );
                }
                if (index == controller.foodLocation) {
                  return Container(
                    color: Colors.red,
                  );
                }
                return Container(
                  color: Colors.white,
                );
              },
            ),
          ),
        ),
        floatingActionButton: x ? FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            controller.startGame(context);
            x=false;
          },
          child: controller.start
              ? Text((controller.snakePosition.length - 3).toString() ,  style: const TextStyle(color: Colors.black))
              : const Text('Start' , style: TextStyle(color: Colors.black),),
        ) : FloatingActionButton(
          backgroundColor: Colors.grey,
          elevation: 0.0,
          onPressed: (){
            controller.gameOver() ;
            //   Get.back() ;
            Get.offNamed((AppRoutes.navigate)) ;
            print("Back to Home page");
          } ,
          child: const Text('Exit' , style: TextStyle(color: Colors.black),
          ),

        )));
  }
}
