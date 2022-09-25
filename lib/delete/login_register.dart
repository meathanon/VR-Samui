// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:samui_vr_app/screen/login.dart';
// import 'package:samui_vr_app/screen/register.dart';
// import 'package:samui_vr_app/widgets/constants.dart';

// class TestD extends StatelessWidget {
//   const TestD({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned(
//             child: SvgPicture.asset("assets/icons/splash_bg.svg"),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Column(
//                 children: [
//                   Spacer(),
//                   SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Image.asset(
//                       "assets/images/logo-app.png",
//                     ),
//                   ),
//                   Spacer(),
//                   // As you can see we need more paddind on our btn
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) {
//                           return LoginScreen();
//                         }));
//                       },
//                       style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFF6CD8D1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: Text("LOGIN",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: defaultPadding),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) {
//                             return RegisterScreen();
//                           }));
//                         },
//                         style: TextButton.styleFrom(
//                           // backgroundColor: Color(0xFF6CD8D1),
//                           elevation: 0,
//                           backgroundColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             side: BorderSide(color: Color(0xFF6CD8D1)),
//                           ),
//                         ),
//                         child: Text(
//                           "SIGN UP",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
