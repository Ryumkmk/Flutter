import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studyapi/constellationapi.dart';
import 'package:studyapi/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConstellationPage extends StatefulWidget {
  const ConstellationPage({super.key});

  @override
  State<ConstellationPage> createState() => _ConstellationPageState();
}

class _ConstellationPageState extends State<ConstellationPage> {
  List results = [];
  String enName = '';
  String jpName = '';

  Future<void> fetchConstellation() async {
    final res = await http.get(Uri.parse(
        'https://private-anon-2523f60b7f-hoshimiru.apiary-mock.com/hoshimiru/constellation?lat=35&lng=123&date=2022-12-06&hour=22&min=00'));
    var jsonRes = jsonDecode(res.body);

    results = jsonRes['result'];
    enName = results[1]['enName'];
    jpName = utf8.decode(results[1]['jpName'].runes.toList());
    print(enName);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchConstellation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('星座機能（study）'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(enName),
            Text(jpName),
          ],
        ),
      ),
    );
  }
}
