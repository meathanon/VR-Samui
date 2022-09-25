import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, position){
          return _buildPageItem(position);
        }),
    );
  }
  Widget _buildPageItem(int index){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}