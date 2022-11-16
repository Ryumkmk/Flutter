import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class my_win_look extends StatefulWidget {
  const my_win_look({super.key});

  @override
  State<my_win_look> createState() => _my_win_lookState();
}

class _my_win_lookState extends State<my_win_look> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You win the game!!',
            style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 201, 9, 82),
            ),

            ),
            SizedBox(
              height: 256,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}

