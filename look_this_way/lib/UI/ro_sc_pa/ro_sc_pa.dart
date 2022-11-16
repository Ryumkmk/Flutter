import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:look_this_way/UI/look_this_way/my_win_page.dart';
import 'package:look_this_way/UI/look_this_way/my_lose_page.dart';

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = '最初はグー！';

  int button_valid = 1;

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    computerHand = randomNumToHand(Random().nextInt(3));
  }

  String randomNumToHand(int randomNum) {
    switch (randomNum) {
      case 0:
        return '✊';
      case 1:
        return '✌';
      case 2:
        return '✋';
      default:
        return '👐';
    }
  }

  void judge() {
    if (computerHand == myHand) {
      result = 'Draw';
    } else if (myHand == '✊' && computerHand == '✌' ||
        myHand == '✋' && computerHand == '✊' ||
        myHand == '✌' && computerHand == '✋') {
      result = 'Win';
      button_valid = 0;
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => my_win_ro_page()));
        button_valid = 1;
        result = '最初はグー！';
        setState(() {});
      });
    } else {
      result = 'Lose';
      button_valid = 0;
      Timer(Duration(seconds: 1), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => my_lose_ro_page()));
        button_valid = 1;
        result = '最初はグー！';
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('じゃんけん!'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 64,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            RotatedBox(
              quarterTurns: 2,
              child: Text(
                computerHand,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(
              height: 128,
            ),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          selectHand('✊');
                        },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          selectHand('✌');
                        },
                  child: Text('✌'),
                ),
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          selectHand('✋');
                        },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
