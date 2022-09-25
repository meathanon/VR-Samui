// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samui_vr_app/screen/login.dart';
// import 'package:samui_vr_app/screen/register.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo[700],
//       body: SafeArea(
//         child: Center(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           child: Form(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: 150,
//                     height: 150,
//                     child: Image.asset("assets/images/logo-app.png"),
//                   ),

//                   SizedBox(height: 40),

//                   // Welcome to VR App
//                   Text(
//                     "Welcome to VR App",
//                     style: GoogleFonts.secularOne(
//                       color: Colors.white,
//                       fontSize: 35,
//                     ),
//                   ),
//                   SizedBox(height: 5),
                  
//                   Text(
//                     "Samui Island, Surat Thani",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(height: 50),

//                   // sign in button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       child: Text("LOGIN", style: TextStyle(color: Colors.black, fontSize: 20)),
//                       onPressed: () {
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) {
//                           return LoginScreen();
//                         }));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white.withOpacity(0.80),
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15))),
//                     ),
//                   ),

//                   SizedBox(height: 7),

//                   // register button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       child:
//                           Text("SIGN UP", style: TextStyle(color: Colors.black, fontSize: 20)),
//                       onPressed: () {
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) {
//                           return RegisterScreen();
//                         }));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         // backgroundColor: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                             side: BorderSide(color: Color(0xFF6CD8D1)),
//                           ),
//                         // primary: Colors.white.withOpacity(0.80),
//                         // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                         // shape: RoundedRectangleBorder(
//                         // borderRadius: BorderRadius.circular(15))),
//                     ),
//                   ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )),
//       ),
//     );
//   }
// }
