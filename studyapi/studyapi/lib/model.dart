import 'dart:convert';
import 'package:flutter/material.dart';


class Constellation {
  final List <String>result;
  // final String enName;
  // final String jpName;
  // final String starImage_URL;

  Constellation({
    required this.result,
    // required this.enName,
    // required this.jpName,
    // required this.starImage_URL,
  });


  factory Constellation.fromJson(Map<String,dynamic> json){

    List <String> resultToList(dynamic result){

      List <String>ret =[];
      for(int i=0;i<result.length;i++){
        ret.add(result[i]['jpName']);
    }
  return ret;

  }
  return Constellation(
    result: resultToList(json['result']),
  );
}
}