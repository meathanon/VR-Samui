// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/model/traveler_n.dart';
import 'package:url_launcher/link.dart';

class DetailTraveler extends StatefulWidget {
  final int id;
  DetailTraveler({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailTraveler> createState() => _DetailTravelerState();
}

class _DetailTravelerState extends State<DetailTraveler> {
  List img = [
    "wat-prayai.jpg",
    "wat-plai-laem.jpg",
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
                    color: Colors.black87.withOpacity(0.3),
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
              bottom: 50,
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
                          popular[widget.id].name!,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.locationDot,
                            color: Colors.indigo),
                        SizedBox(
                          width: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Bophut, Koh Samui",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black87.withOpacity(.8),
                                )))
                      ],
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    // Link(
                    //   target: LinkTarget.blank,
                    //   uri: Uri.parse("https://www.youtube.com"),
                    //   builder: (context, followLink) => ElevatedButton(
                    //     onPressed: followLink,
                    //     child: Text("Start"),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // GestureDetector(
                    //   onTap: () => Navigator(),
                    //   child: Container(
                    //     padding: EdgeInsets.all(10),
                    //     child: Center(
                    //       child: Text("Start", style: GoogleFonts.poppins(
                    //         color: Colors.white,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w700,
                    //       ),),
                    //     ),
                    //     decoration: BoxDecoration(
                    //       color: Colors.amber.shade600,
                    //       border: Border.all(
                    //         color: Colors.amber.shade600,
                    //       ),
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
