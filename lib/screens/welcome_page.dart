// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_interpolation_to_compose_strings, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/screens/widget/app_large_text.dart';
import 'package:samui_vr_app/screens/widget/responsive_button.dart';
import '../cubit/app_cubits.dart';
import 'widget/app_description.dart';
import 'widget/app_text.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "wc-app-2.png",
    "wc-app-3.png",
    "wc-app-4.png",
    "wc-app-5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Welcome to"),
                        AppText(text: "Samui Island", size: 30),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                          ),
                          // width: 120,
                          // child: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     descriptionpage[index].description!,
                          //     style: GoogleFonts.baloo2(
                          //        color: Colors.white,
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.bold,
                          //     ), 
                          //   ),
                          // ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(children: [
                              ResponsiveButton(
                                width: 120,
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(4, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Colors.indigo.shade700
                                  : Colors.indigo.shade700.withOpacity(0.4)),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
