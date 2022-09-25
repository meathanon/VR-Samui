// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, sort_child_properties_last, avoid_print, use_build_context_synchronously

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samui_vr_app/model/profile.dart';
// import 'package:samui_vr_app/screen/login.dart';

// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({Key? key}) : super(key: key);

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
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
//                               "Create Account",
//                               style: GoogleFonts.fredokaOne(
//                                 color: Colors.grey[850],
//                                 fontSize: 40,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5),

//                           Center(
//                             child: Text(
//                               "Register now to get started.",
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
//                               child: Text("Sign Up",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold)),
//                               onPressed: () async {
//                                 if (formKey.currentState!.validate()) {
//                                   formKey.currentState!.save();
//                                   try {
//                                     await FirebaseAuth.instance
//                                         .createUserWithEmailAndPassword(
//                                             email: profile.email!,
//                                             password: profile.password!)
//                                         .then((value) {
//                                       formKey.currentState!.reset();
//                                       Fluttertoast.showToast(
//                                           msg: "Successfully registered",
//                                           gravity: ToastGravity.TOP);
//                                       Navigator.pushReplacement(context,
//                                           MaterialPageRoute(builder: (context) {
//                                         return LoginScreen();
//                                       }));
//                                     });
//                                   } on FirebaseAuthException catch (e) {
//                                     // print(e.message);
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
