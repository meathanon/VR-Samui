// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samui_vr_app/homescreen/feedback_screen.dart';
import 'package:samui_vr_app/homescreen/guide_page.dart';
import 'package:samui_vr_app/homescreen/transport_screen.dart';

import '../../screens/home_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = [
    Icon(
      FontAwesomeIcons.house,
      color: Colors.amber.shade500,
      size: 25,
    ),
    Icon(
      FontAwesomeIcons.car,
      color: Colors.amber.shade500,
      size: 25,
    ),
    Icon(
      FontAwesomeIcons.screwdriverWrench,
      color: Colors.amber.shade500,
      size: 25,
    ),
    Icon(
      FontAwesomeIcons.solidComment,
      color: Colors.amber.shade500,
      size: 25,
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Curved Navigation Bar'),
      //   backgroundColor: Colors.blue[300],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.indigo.shade500,
        height: 70,
        animationDuration: const Duration(milliseconds: 300),
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = HomePage();
        break;
      case 1:
        widget = TransportScreen();
        break;
      case 2:
        widget = GuidePage();
        break;
      case 3:
        widget = FeedbackScreen();
        break;
      default:
        widget = HomePage();
        break;
    }
    return widget;
  }
}
