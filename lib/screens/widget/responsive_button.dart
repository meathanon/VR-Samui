// ignore_for_file: unnecessary_import, unused_import, sort_child_properties_last
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/screen/login.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Get Started',
          style:
              GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
      style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      },
    );
  }
}
