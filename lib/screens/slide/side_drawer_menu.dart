// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawerMenu extends StatelessWidget {
  const SideDrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(),
          ListTile(
            leading: Icon(Icons.home, color: Colors.amber.shade600),
            title: Text('About SCIT'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.school_rounded, color: Colors.amber.shade600),
            title: Text('Cirriculam'),
            onTap: () {
              Navigator.pushNamed(context, '/curriculam');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city, color: Colors.amber.shade600),
            title: Text('Contact'),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.indigo.shade600,
      child: Column(
        children: [
          Text('SCIT PSU Surat', style: GoogleFonts.anton(fontSize: 35, color: Colors.white),)
        ],
      ),
    );
  }
}
