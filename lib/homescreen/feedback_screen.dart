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
              title: Text(
                "FEEDBACK",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.indigo.withOpacity(0.90),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    margin: EdgeInsets.only(top: 60, left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.1),
                            offset: Offset(0, 1),
                            blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Review Application",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text("Contact and report to developers.",
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        top: 25,
                        left: 30,
                        right: 30), //vertical: 85, horizontal: 30
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.1),
                            offset: Offset(0, 1),
                            blurRadius: 10),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.userLarge,
                                  color: Colors.indigo.shade500,
                                ),
                                labelText: 'Name',
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigo),
                                ),
                              ),
                              validator: RequiredValidator(
                                  errorText: "Please enter name"),
                              onSaved: (String? name) {
                                myTraveler.name = name;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  FontAwesomeIcons.solidEnvelope,
                                  color: Colors.indigo.shade500,
                                ),
                                labelText: 'Email',
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontSize: 16,
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
                                RequiredValidator(
                                    errorText: "Please enter email")
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
                                  color: Colors.black54,
                                  fontSize: 16,
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
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                // <-- ElevatedButton
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  backgroundColor: Colors.indigo.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    await _travelerCollection.add({
                                      "name": myTraveler.name,
                                      "email": myTraveler.email,
                                      "description": myTraveler.description,
                                    });
                                    formKey.currentState!.reset();
                                  }
                                },
                                icon: Icon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  size: 16,
                                ),
                                label: Text('SEND'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
