// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, unused_local_variable, unused_element, sort_child_properties_last, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:samui_vr_app/homescreen/home_bottom.dart';
import 'package:samui_vr_app/utils/app_layout.dart';
import 'package:samui_vr_app/utils/app_style.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final PageController _pageController = PageController();
  final String _imageBG = 'assets/images/chaweng-beach.jpg';
  final List<String> _imageList = const [
    'assets/images/guide-1.png',
    'assets/images/guide-2.png',
    'assets/images/guide-3.png',
  ];
  // int Homemain = 0;
  double _currentPage = 0;
  bool _hideIntroduction = false;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  Widget _pageViewChildimage(String imageString) {
    return Image.asset(
      imageString,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _pageViewIndicator(int location) {
    return Padding(
        padding: const EdgeInsets.only(right: 6, left: 6),
        child: Icon(
          Icons.lens,
          size: 14,
          color: location - 1 <= _currentPage && _currentPage < location
              ? Colors.blue[900]
              : Colors.grey[600],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      Scaffold(
        // appBar: AppBar(
        //   title: Text("Guide"),
        //   centerTitle: true,
        //   backgroundColor: Colors.indigo.withOpacity(0.90),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        //   ),
        // ),
      ),
      !_hideIntroduction
          ? Positioned(
              child: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_imageBG), fit: BoxFit.fill)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          child: Container(
                            width: size.width - 60,
                            height: 480,
                            color: Colors.white,
                            child: PageView(
                              controller: _pageController,
                              children: <Widget>[
                                _pageViewChildimage(_imageList[0]),
                                _pageViewChildimage(_imageList[1]),
                                _pageViewChildimage(_imageList[2]),
                              ],
                            ),
                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 3,
                          margin: EdgeInsets.all(10),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _pageViewIndicator(1),
                              _pageViewIndicator(2),
                              _pageViewIndicator(3),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 40.0, right: 40.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(12.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    _currentPage < 2
                                        ? 'Next'
                                        : 'Okay ! Go to Main',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              textColor: _currentPage < 2
                                  ? Colors.black
                                  : Colors.white,
                              color: _currentPage < 2
                                  ? Colors.white
                                  : Colors.blue[900],
                              padding: EdgeInsets.all(10),
                              onPressed: () {
                                if (_pageController.page!.toInt() < 2) {
                                  _pageController.animateToPage(
                                      _pageController.page!.toInt() + 1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                }else {
                                  setState(() {
                                    _hideIntroduction = true;
                                    _pageController.jumpToPage(0);
                                  });
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Homemain()),
                                // );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    ]);
  }
}
