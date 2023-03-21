// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, dead_code, prefer_const_declarations, prefer_interpolation_to_compose_strings, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/model/traveler_n.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTravelerBeach extends StatefulWidget {
  final int id;
  DetailTravelerBeach({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailTravelerBeach> createState() => _DetailTravelerBeachState();
}

class _DetailTravelerBeachState extends State<DetailTravelerBeach> {
  List img = [
    "lamai-beach.jpg",
  ];

  var descreiption = [
    "Lamai Beach is the second most popular beach on Koh Samui. Which has the beauty of the sea and white beaches, not allergic to Chaweng Beach But it will be a less crowded beach. and has a more peaceful atmosphere Therefore suitable for tourists who want to relax quietly.",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 8,
            right: 0,
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: FittedBox(
                child: Image.asset("assets/images/" + img[widget.id]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                    stops: const [0, 1],
                    colors: [Colors.white, Colors.white.withOpacity(.02)]),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            width: size.width * .8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        popularr[widget.id].name!,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(FontAwesomeIcons.locationDot, color: Colors.red),
                      SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Maret, Koh Samui",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black87.withOpacity(.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    descreiption[widget.id],
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.kanit(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse(
                        "https://youtube.com/watch?v=QcG4ya-Olic"), //urltravel[widget.id].url! //Uri.parse(urltravel[widget.id].url!),
                    builder: (context, followLink) => ElevatedButton(
                      onPressed: followLink,
                      child: Text("Start"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                        primary: Colors.amber.shade400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 10),
                        textStyle: GoogleFonts.poppins(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // ElevatedButton(
                  //   child: Text(
                  //     "Start",
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 20,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   onPressed: () async {
                  //     final url = 'http://youtube.com/watch?v=XG4rWqiG0jo';

                  //     openBrowserURL(url: url, inApp: true);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.amber.shade400,
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 40, vertical: 10),
                  //       textStyle: const TextStyle(
                  //           fontSize: 30, fontWeight: FontWeight.bold)),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future openBrowserURL({
  required String url,
  bool inApp = false,
}) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: inApp,
      enableJavaScript: true,
    );
  }
}
