// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/bottom_navigation/pages/home_bottom.dart';
import 'package:samui_vr_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String Images,
    required String title,
    required String subtitle,
  }) =>
      SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Colors.teal.shade700,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 13),
                ),
              )
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GUIDE LOCATION",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.withOpacity(0.90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
                color: Colors.green.shade100,
                Images: 'assets/images/guides-1.png',
                title: 'Choose category',
                subtitle: 'On the first page, there are attractions for you to choose from. which will have a category for each location Allows you to select the desired attraction category.'),
            buildPage(
                color: Colors.green.shade100,
                Images: 'assets/images/guides-2.png',
                title: 'Choose tourism attraction',
                subtitle: 'After selecting the attraction category Allows you to select the desired attractions.'),
            buildPage(
                color: Colors.green.shade100,
                Images: 'assets/images/guides-3.png',
                title: 'Click to detail',
                subtitle: 'You can find details of the location on this page. When you decide to see the attraction, press Start to watch a 360 degree video of the attraction.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(3)
                ),
                primary: Colors.teal.shade700,
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(60)
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  fontSize: 20),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },)
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('SKIP'),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                    ),
                  ),
                  TextButton(
                    child: Text('NEXT'),
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                  ),
                ],
              ),
            ),
    );
  }
}
