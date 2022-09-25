// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_field, unused_import

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samui_vr_app/homescreen/guide_main.dart';
// import 'package:samui_vr_app/homescreen/guide_screen.dart';
// import 'package:samui_vr_app/homescreen/home_screen.dart';
// import 'package:samui_vr_app/model/user_model.dart';

// class Homemain extends StatefulWidget {
//   Homemain({Key? key}) : super(key: key);

//   @override
//   State<Homemain> createState() => HomemainState();
// }

// class HomemainState extends State<Homemain> {

//   // User? user = FirebaseAuth.instance.currentUser;
//   // UserModel loggedInUser = UserModel();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   FirebaseFirestore.instance
//   //       .collection("users")
//   //       .doc(user!.uid)
//   //       .get()
//   //       .then((value) {
//   //         this.loggedInUser = UserModel.fromMap(value.data());
//   //         setState(() {});
//   //       } 
//   //       );
//   //   }
//   // }
//   @override
//   int _selectedIndex = 0;
//   final List<Widget>_widgetOptions = <Widget>[
//     HomeMainScreen(),
//     GuideMain(),
//     const Text("Profile"),
//   ];

//   void _onItemTapped(int index) {
//      setState(() {
//        _selectedIndex = index;
//      });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions[_selectedIndex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         elevation: 10,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Colors.indigo[700],
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: Colors.blueGrey[600],
//         items: [
//           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
//           activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
//            label: "Home"),
//           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_info_regular),
//           activeIcon: Icon(FluentSystemIcons.ic_fluent_info_filled),
//            label: "LocationGuide"),
//           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//           activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
//            label: "Profile"),
//         ],
//       ),
//     );
//   }
// }