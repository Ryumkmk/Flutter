import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studyapi/model.dart';

Future<Constellation> fetchConstellation() async {
  final res = await http.get(Uri.parse('https://private-anon-2523f60b7f-hoshimiru.apiary-mock.com/hoshimiru/constellation?lat=35&lng=123&date=2022-12-06&hour=22&min=00'));
  if (res.statusCode == 200) {
    return Constellation.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to Load Constellation');
  }
}
