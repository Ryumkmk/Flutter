import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:look_this_way/UI/my_win_judge/my_win.dart';

class my_win_ro_page extends StatefulWidget {
  const my_win_ro_page({super.key});

  @override
  State<my_win_ro_page> createState() => _my_win_ro_pageState();
}

class _my_win_ro_pageState extends State<my_win_ro_page> {
  String myfinger = "๐";
  Image computer_face = Image.asset('images/pose_reiwa_man.png');
  int cpu_face_num = 0;
  int button_valid = 1;

  void selected_finger(String finger) {
    myfinger = finger;
    generate_random_num();
    judge();
    setState(() {});
  }

  void generate_random_num() {
    cpu_face_num = Random().nextInt(4);
    computer_face = random_num_to_face(cpu_face_num);
  }

  Image random_num_to_face(int num) {
    switch (num) {
      case 0:
        return Image.asset('images/point_up.png');
      case 1:
        return Image.asset('images/point_left.png');
      case 2:
        return Image.asset('images/point_right.png');
      case 3:
        return Image.asset('images/point_down.png');
      default:
        return Image.asset('images/point_up.png');
    }
  }

  void judge() {
    if (cpu_face_num == 0 && myfinger == "๐" ||
        cpu_face_num == 1 && myfinger == "๐" ||
        cpu_face_num == 2 && myfinger == "๐" ||
        cpu_face_num == 3 && myfinger == "๐") {
      button_valid = 0;
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => my_win_look()));
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
            SizedBox(
              child: computer_face,
              height: 256,
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              myfinger,
              style: TextStyle(
                fontSize: 64,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: button_valid == 0
                  ? null
                  : () {
                      selected_finger('๐');
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
                          selected_finger('๐');
                        },
                  child: Text('๐'),
                ),
                ElevatedButton(
                  onPressed: button_valid == 0
                      ? null
                      : () {
                          selected_finger('๐');
                        },
                  child: Text('๐'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: button_valid == 0
                  ? null
                  : () {
                      selected_finger('๐');
                    },
              child: Text('๐'),
            ),
          ],
        ),
      ),
    );
  }
}
