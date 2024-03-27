import 'dart:io';
import 'robots.dart';

class Game {
  final int goal = 21; // made as a var to make it easier to read and possibly change this value
  final numLimit = 3;
  String startingTurn = 'user'; 
  Map<String, int> score = {'user': 0, 'robot': 0, 'total': 0}; // keeps track of the score
  String robot = Robots.robots.keys.first; // gets the first robot in the list

  void options() {
    // runs the commands the user inputs and change settings 
    while (true) {
      String userStr = (stdin.readLineSync() ?? '').toUpperCase();
      if (userStr == '') {
        continue;
      } else if (userStr == 'SCORE') {
        print('You have won ${score["user"]} times');
        print('You have lost ${score["robot"]} times');
        print('For a total of ${score["total"]} games played');
      } else if (userStr == 'ROBOTS') {
        print('To change the robot type use then the robot name');
        print('Robots: ');
        for (String name in Robots.robots.keys) {
          print('\t$name');
        }
        print('Current robot is $robot');
      } else if (Robots.robots.containsKey(userStr.toLowerCase())) {
        robot = userStr.toLowerCase();
        print('switched robot to $robot');
      } else if (userStr == 'TURN') {
        startingTurn = startingTurn == 'user' ? 'robot' : 'user';
        print('$startingTurn will now start first');
      } else if (userStr == 'PLAY') {
        gameRun();
      } else if (userStr == 'EXIT') {
        break;
      } else {
        print('command not found heres a list of available comands:');
        print('score - prints the score and total amount of matches');
        print(
            'robots - prints a list of the available robots and prints the current robot selected');
        print('enter the name of a robot to switch to it');
        print('turn - switches who goes first');
        print('play - starts the game with the selected robot and turn order');
        print('exit - quits the application');
      }
    }
  }

  void gameRun() {
    int total = 0;
    String turn = startingTurn;

    print('enter exit to quit the game');
    while (total < goal) {
      print('Current total: $total');
      if (turn == 'user') {
        print('Select a number between 1 and 3');
        while (true) { // constantly asks for a input until the user inputs something that matches all the requirements
          String? userStr = stdin.readLineSync();
          if (userStr == null) {
            print('You didnt enter a number');
            continue;
          } else if (userStr.toUpperCase() == 'EXIT') {
            return;
          }

          int userNum;
          try {
            userNum = int.parse(userStr);
          } catch (e) {
            if (e is FormatException) {
              print("Invalid input format: $userStr");
              print('Please only input whole numbers');
            } else {
              print("An unexpected error occurred: $e");
            }
            continue;
          }
          if (userNum < 1 || userNum > numLimit) {
            print('Please select a number between 1 and $numLimit');
            continue;
          } else if (userNum + total > goal) {
            print('The number you picked brings the total over $goal');
            continue;
          }
          total += userNum;
          break;
        }
      } else if (turn == 'robot') {
        int aiNum = Robots.robots[robot]!(total);
        print('The robot chose $aiNum');
        print('');
        total += aiNum;
      }
      if (total >= goal) {
        score[turn] = score[turn]! + 1;
        score['total'] = score['total']! + 1;
        if (turn == 'user') {
          print('You have won');
        } else {
          print('You lost');
        }
      }
      turn = turn == 'user' ? 'robot' : 'user';
      print('');
    }
  }
}
