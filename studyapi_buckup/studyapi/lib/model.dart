import 'dart:convert';
import 'package:flutter/material.dart';

class Constellation {
  final List enName;
  final List jpName;
  // final String starImage_URL;

  Constellation({
    required this.enName,
    required this.jpName,
    // required this.starImage_URL,
  });

  factory Constellation.fromJson(Map<String, dynamic> json) {
    List resultToList(dynamic result) {
      List ret = [];
      for (int i = 0; i < result.length; i++) {
        ret.add(result[i]['jpName']);
      }
      return ret;
    }

    return Constellation(
      jpName: resultToList(json['result']),
      enName: resultToList(json['result']),


    );
  }
}
