import 'dart:math';
import 'package:flutter/material.dart';
import 'package:look_this_way/UI/ro_sc_pa/ro_sc_pa.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

