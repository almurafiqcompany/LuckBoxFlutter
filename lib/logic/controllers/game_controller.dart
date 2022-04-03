import 'dart:async';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
enum Direction { up, down, left, right }
class GameController extends GetxController {




  List<int> snakePosition = [24, 44, 64];
  int foodLocation = Random().nextInt(700);
  bool start = false.obs as bool;
  Direction direction = Direction.down;
  List<int> totalSpot = List.generate(760, (index) => index); //totalspot
  startGame(BuildContext context) {
    start = true.obs as bool;
    snakePosition = [24, 44, 64].obs;
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      updateSnake();
      if (gameOver()) {
        gameOverAlert(context);
        timer.cancel();
        update() ;
      }
      update() ;
    }

    );
  }

  updateSnake() {

      switch (direction) {
        case Direction.down:
          if (snakePosition.last > 740) {
            snakePosition.add(snakePosition.last - 760 + 20);
            update() ;
          } else {
            snakePosition.add(snakePosition.last + 20);
            update() ;
          }
          break;
        case Direction.up:
          if (snakePosition.last < 20) {
            snakePosition.add(snakePosition.last + 760 - 20);
            update() ;
          } else {
            snakePosition.add(snakePosition.last - 20);
            update() ;
          }
          break;
        case Direction.right:
          if ((snakePosition.last + 1) % 20 == 0) {
            snakePosition.add(snakePosition.last + 1 - 20);
            update() ;
          } else {
            snakePosition.add(snakePosition.last + 1);
            update() ;
          }
          break;
        case Direction.left:
          if (snakePosition.last % 20 == 0) {
            snakePosition.add(snakePosition.last - 1 + 20);
            update() ;
          } else {
            snakePosition.add(snakePosition.last - 1);
            update() ;
          }
          break;
        default:
          update() ;
      }
      if (snakePosition.last == foodLocation) {
        totalSpot.removeWhere((element) => snakePosition.contains(element));

        foodLocation = totalSpot[Random().nextInt(totalSpot.length -
            1)]; //new food location is everywhere expect snackPosition
        update() ;
      } else {
        snakePosition.removeAt(0);
        update() ;
      }

  }

  bool gameOver() {
    final copyList = List.from(snakePosition);
    if (snakePosition.length > copyList.toSet().length) {
      update() ;
      return true;
    } else {
      return false;

    }

  }

  gameOverAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content:
          Text('your score is ' + (snakePosition.length - 3).toString()),
          actions: [
            TextButton(
                onPressed: () {
                  startGame(context);
                  Navigator.of(context).pop(true);
                },
                child: const Text('Play Again')),
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('Exit'))
          ],
        );
      },
    );
    update() ;
  }


}
