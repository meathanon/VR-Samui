// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_print, unused_import, prefer_final_fields, sort_child_properties_last
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/model/traveler.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final formKey = GlobalKey<FormState>();
  Traveler myTraveler = Traveler(name: '', email: '', description: '');

  TextEditingController _nameController = TextEditingController();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _travelerCollection =
      FirebaseFirestore.instance.collection("traveler");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Feedback"),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.indigo.withOpacity(0.90),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
                margin: EdgeInsets.symmetric(vertical: 85, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.shade300,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 5),
                        blurRadius: 20)
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Center(
                        //   child: Text(
                        //     "Feedback",
                        //     style: GoogleFonts.poppins(
                        //       color: Colors.grey.shade900,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 40,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.userLarge,
                              color: Colors.indigo.shade500,
                            ),
                            labelText: 'Name',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.indigo,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                          validator:
                              RequiredValidator(errorText: "Please enter name"),
                          onSaved: (String? name) {
                            myTraveler.name = name;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   "Surname",
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        // TextFormField(),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidEnvelope,
                              color: Colors.indigo.shade500,
                            ),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.indigo,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                          validator: MultiValidator([
                            EmailValidator(
                                errorText: "Please enter a valid email"),
                            RequiredValidator(errorText: "Please enter email")
                          ]),
                          onSaved: (String? email) {
                            myTraveler.email = email;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidComment,
                              color: Colors.indigo.shade500,
                            ),
                            labelText: 'Description',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.indigo,
                            ),
                            // contentPadding: EdgeInsets.symmetric(vertical: 50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                          onSaved: (String? description) {
                            myTraveler.description = description;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              child: Text("Send", style: GoogleFonts.poppins()),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade600,
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  )),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  await _travelerCollection.add({
                                    "name": myTraveler.name,
                                    "email": myTraveler.email,
                                    "description": myTraveler.description
                                  });
                                  formKey.currentState!.reset();
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
