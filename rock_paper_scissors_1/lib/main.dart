import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = 'Win';

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
    } else {
      result = 'Lose';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Rock Paper Scissors !'),
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
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌');
                  },
                  child: Text('✌'),
                ),
                ElevatedButton(
                  onPressed: () {
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
