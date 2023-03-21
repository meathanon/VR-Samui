// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last, prefer_const_constructors_in_immutables, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_declarations, unused_local_variable, unused_field, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/homescreen/page/first_page.dart';
import 'package:samui_vr_app/homescreen/page/second_page.dart';
import 'package:samui_vr_app/utils/app_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({Key? key}) : super(key: key);

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen>
    with SingleTickerProviderStateMixin { 
  late TabController controller;


  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'TRANSPORTS',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.indigo.withOpacity(0.90),
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            bottom: TabBar(
              controller: controller,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
               indicatorColor: Colors.amberAccent,
               indicatorSize: TabBarIndicatorSize.label,
               indicatorWeight: 3,  
              tabs: [
                Tab(text: 'Cruise', 
                icon: Icon(FontAwesomeIcons.sailboat)),
                Tab(text: 'Airplane', 
                icon: Icon(FontAwesomeIcons.planeDeparture)),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              FirstPage(),
              SecondPage(),
            ],
          ),
        );
    }
