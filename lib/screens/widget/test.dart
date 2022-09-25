// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("https://.youtube.com/");
    return Scaffold(
        body: Center(
            child: Container(
      height: 50,
      width: 120,
      child: ElevatedButton(
        child: Text("Launch"),
        onPressed: () {
          launchUrl(url);
        },
      ),
    )));
  }
}
