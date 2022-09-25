// // ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_import, deprecated_member_use
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:samui_vr_app/homescreen/guide_page.dart';
// import 'package:samui_vr_app/homescreen/home_bottom.dart';
// import '../widgets/slide_dots.dart';
// import '../model/slide.dart';
// import 'package:samui_vr_app/utils/app_style.dart';
// import '../widgets/slide_item.dart';

// class GuideMain extends StatefulWidget {
//   @override
//   State<GuideMain> createState() => _GuideMainState();
// }

// class _GuideMainState extends State<GuideMain> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(initialPage: 0);

//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (_currentPage < 2) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }

//       _pageController.animateToPage(_currentPage,
//           duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   _onPageChanged(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Guide"),
//         centerTitle: true,
//         backgroundColor: Colors.indigo.withOpacity(0.90),
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(30),
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: <Widget>[
//                     PageView.builder(
//                       scrollDirection: Axis.horizontal,
//                       controller: _pageController,
//                       itemCount: slideList.length,
//                       onPageChanged: _onPageChanged,
//                       itemBuilder: (ctx, i) => SlideItem(i),
//                     ),
//                     Stack(
//                       alignment: AlignmentDirectional.topStart,
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               for (int i = 0; i < slideList.length; i++)
//                                 if (i == _currentPage)
//                                   SlideDots(true)
//                                 else
//                                   SlideDots(false)
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   FlatButton(
//                     child: Text("Get Started",
//                         style: TextStyle(color: Colors.white, fontSize: 22)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     padding: EdgeInsets.all(13),
//                     color: Colors.indigo,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Homemain()),
//                       );
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
