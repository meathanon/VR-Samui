// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, must_be_immutable, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samui_vr_app/model/traveler_n.dart';
import 'package:samui_vr_app/screens/widget/app_large_text.dart';
import 'package:samui_vr_app/screens/widget/datail_traveler.dart';
import 'package:samui_vr_app/widgets/constants.dart';
import 'slide/side_drawer_menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List img = [
    "wat-prayai.jpg",
    "wat-plai-laem.jpg",
  ];

  List image = [
    "tarnim-magic-garden.jpg",
    "hinta-hinyay.jpg",
  ];

  var images = {
    "na-muang-waterfalls.jpg": "Na Muang Waterfalls",
    "chaweng-beach.jpg": "Chaweng Beach",
    "bophut-beach.jpg": "Bophut Beach",
    "samui-aquarium.jpg": "Samui Aquarium",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Home',
        ),
        backgroundColor: Colors.indigo.withOpacity(0.90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(FontAwesomeIcons.barsStaggered),
            );
          }),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              //hello guess text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Hello Traveler"),
              ),
              SizedBox(
                height: 20,
              ),
              //tab bar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: Colors.grey.shade800, radius: 4),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Temple",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Beach",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Landmark",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Temple tab
                    ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailTraveler(id: index)
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 15),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/" + img[index]),
                                  fit: BoxFit.cover),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1, top: 200),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.7),
                                borderRadius: BorderRadius.all(Radius.circular(10),)
                              ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Icon(
                                        FontAwesomeIcons.locationArrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            popular[index].name!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            popular[index].city!,
                                           style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Beach tab
                    ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/lamai-beach.jpg"),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1, top: 200),
                            child: Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                              borderRadius: BorderRadius.all(Radius.circular(10),)
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    FontAwesomeIcons.locationArrow,
                                    color: Colors.white
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Lamai Beach',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                      Text(
                                        'Koh Samui',
                                       style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ),
                        );
                      },
                    ),
                    // Landmark
                    ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 15),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/" + image[index]),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1, top: 200),
                            child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.7),
                                borderRadius: BorderRadius.all(Radius.circular(10),)
                              ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    FontAwesomeIcons.locationArrow,
                                    color: Colors.white
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        populars[index].name!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        populars[index].city!,
                                       style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    AppLargeText(
                      text: "Popular Landmark",
                      size: 22,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 140,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/" +
                                      images.keys.elementAt(index)),
                                  fit: BoxFit.cover),
                            ),
                            child: Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 55),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        bottompopular[index].name!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      drawer: SideDrawerMenu(),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
