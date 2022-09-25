// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, library_private_types_in_public_api

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samui_vr_app/homescreen/guide_screen.dart';
// import 'package:samui_vr_app/homescreen/home_bottom.dart';
// import 'package:samui_vr_app/homescreen/home_screen.dart';
// import 'package:samui_vr_app/model/profile.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final formKey = GlobalKey<FormState>();
//   Profile profile = Profile();
//   final Future<FirebaseApp> firebase = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: firebase,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text("Error"),
//               ),
//               body: Center(
//                 child: Text("${snapshot.error}"),
//               ),
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Scaffold(
//               backgroundColor: Colors.grey[200],
//               body: SafeArea(
//                 child: Center(
//                     child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Form(
//                     key: formKey,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: SizedBox(
//                               width: 180,
//                               height: 180,
//                               child: Image.asset("assets/images/logo-page.png"),
//                             ),
//                           ),

//                           SizedBox(height: 20),

//                           // Welcome to VR App
//                           Center(
//                             child: Text(
//                               "Welcome to VR App",
//                               style: GoogleFonts.fredokaOne(
//                                 color: Colors.grey[850],
//                                 fontSize: 36,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5),

//                           Center(
//                             child: Text(
//                               "Samui island, SuratThani",
//                               style: GoogleFonts.fredokaOne(
//                                 color: Colors.grey[850],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 50),

//                           // sign in textfield
//                           Text("EMAIL",
//                               style: GoogleFonts.montserrat(
//                                 color: Colors.black87,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           TextFormField(
//                             validator: MultiValidator([
//                               RequiredValidator(errorText: "Email is required"),
//                               EmailValidator(errorText: "Email is not valid")
//                             ]),
//                             keyboardType: TextInputType.emailAddress,
//                             onSaved: (String? email) {
//                               profile.email = email;
//                             },
//                           ),

//                           // TextFormField(),
//                           SizedBox(height: 15),

//                           // password textfield
//                           Text("PASSWORD",
//                               style: GoogleFonts.montserrat(
//                                 color: Colors.black87,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           TextFormField(
//                             validator: RequiredValidator(
//                                 errorText: "Please enter password"),
//                             obscureText: true,
//                             onSaved: (String? password) {
//                               profile.password = password;
//                             },
//                           ),

//                           SizedBox(height: 15),

//                           // sign in button
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               child: Text("Login",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold)),
//                               onPressed: () async {
//                                 if (formKey.currentState!.validate()) {
//                                   formKey.currentState!.save();
//                                   try {
//                                     await FirebaseAuth.instance
//                                         .signInWithEmailAndPassword(
//                                             email: profile.email!,
//                                             password: profile.password!)
//                                         .then((value) {
//                                       formKey.currentState!.reset();
//                                       Fluttertoast.showToast(
//                                           msg: "Login successfully",
//                                           gravity: ToastGravity.TOP);
//                                       Navigator.pushReplacement(context,
//                                           MaterialPageRoute(builder: (context) {
//                                         return Homemain();
//                                       }));
//                                     });
//                                   } on FirebaseAuthException catch (e) {
//                                     Fluttertoast.showToast(
//                                         msg: e.message!,
//                                         gravity: ToastGravity.TOP);
//                                   }
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue[700],
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15))),
//                             ),
//                           ),

//                           SizedBox(height: 7),

//                           // register button
//                           // SizedBox(
//                           //   width: double.infinity,
//                           //   child: ElevatedButton(
//                           //     child: Text("Login now",
//                           //         style: TextStyle(
//                           //             fontSize: 20,
//                           //             fontWeight: FontWeight.bold)),
//                           //     onPressed: () {
//                           //       Navigator.push(context,
//                           //           MaterialPageRoute(builder: (context) {
//                           //         return LoginScreen();
//                           //       }));
//                           //     },
//                           //     style: ElevatedButton.styleFrom(
//                           //         primary: Colors.black,
//                           //         padding: const EdgeInsets.symmetric(
//                           //             horizontal: 20, vertical: 10),
//                           //         shape: RoundedRectangleBorder(
//                           //             borderRadius: BorderRadius.circular(15))),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )),
//               ),
//             );
//           }
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         });
//   }
// }
