// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last, prefer_const_constructors_in_immutables, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_declarations, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/utils/app_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class TransportScreen extends StatefulWidget {
  TransportScreen({Key? key}) : super(key: key);

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transport"),
          centerTitle: true,
          backgroundColor: Colors.indigo.withOpacity(0.90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: (TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber[600],
                      ),
                      tabs: [
                        Tab(text: "Cruise"),
                        Tab(text: "Airplane"),
                      ],
                      labelStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      labelColor: Colors.white)),
                ),
              ),
              // SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 70,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        onPressed: () async {
                          const url = 'https://google.com';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text('Cruise'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
