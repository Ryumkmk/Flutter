import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class my_lose_look extends StatefulWidget {
  const my_lose_look({super.key});

  @override
  State<my_lose_look> createState() => _my_lose_lookState();
}

class _my_lose_lookState extends State<my_lose_look> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You lose the game!!',
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