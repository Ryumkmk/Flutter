import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:look_this_way/UI/my_win_judge/my_lose.dart';

class my_lose_ro_page extends StatefulWidget {
  const my_lose_ro_page({super.key});

  @override
  State<my_lose_ro_page> createState() => _my_lose_ro_pageState();
}

class _my_lose_ro_pageState extends State<my_lose_ro_page> {
  String computer_finger = "๐";
  Image my_face = Image.asset('images/pose_reiwa_man.png');
  int my_face_num = 0;
  int button_valid = 1;

  void selected_face(Image face) {
    my_face = face;
    generate_random_num();
    judge();
    setState(() {});
  }

  void generate_random_num() {
    computer_finger = random_num_to_face(Random().nextInt(4));
  }

  String random_num_to_face(int num) {
    switch (num) {
      case 0:
        return "๐";
      case 1:
        return "๐";
      case 2:
        return "๐";
      case 3:
        return "๐";
      default:
        return "๐";
    }
  }

  void judge() {
    if (my_face_num == 0 && computer_finger == "๐" ||
        my_face_num == 1 && computer_finger == "๐" ||
        my_face_num == 2 && computer_finger == "๐" ||
        my_face_num == 3 && computer_finger == "๐") {
      button_valid = 0;
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => my_lose_look()));
        button_valid = 1;
      });
    } else {
      button_valid = 0;
      Timer(Duration(seconds: 1), () {
        Navigator.popUntil(context, (route) => route.isFirst);
        button_valid = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('ใใฃใกใใใฆใใค!'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(computer_finger,
            style: TextStyle(
              fontSize: 64,
            ),),
            SizedBox(
              height: 128,
            ),
            SizedBox(
              child: my_face,
              height: 128,
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: button_valid == 0
                  ? null
                  : () {
                      my_face_num = 0;
                      selected_face(Image.asset('images/point_up.png'));
                    },
              child: Text('๐'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          my_face_num = 1;
                          selected_face(Image.asset('images/point_left.png'));
                        },
                  child: Text('๐'),
                ),
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          my_face_num = 2;
                          selected_face(Image.asset('images/point_right.png'));
                        },
                  child: Text('๐'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: button_valid == 0
                  ? null
                  : () {
                      my_face_num = 3;
                      selected_face(Image.asset('images/point_down.png'));
                    },
              child: Text('๐'),
            ),
          ],
        ),
      ),
    );
  }
}
