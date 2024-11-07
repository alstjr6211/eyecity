import 'package:flutter/material.dart';

import 'package:eyecity/constant/colors.dart';


class Menutext extends StatelessWidget {

  final String title;
  final double screenwidth;

  Menutext({
    required this.title,
    required this.screenwidth,

  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        // fontFamily: "";
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: blackColor,
      ),
    );
  }
}

class MenutextReportTag extends StatelessWidget {


  final String title;
  final String subtitle;
  final double screenwidth;
  final double screenheight;

  MenutextReportTag({
    required this.title,
    required this.subtitle,
    required this.screenwidth,
    required this.screenheight,

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth * 0.55,
      height: screenheight * 0.1,
      child: Column(
        children: [
          SizedBox(height: screenheight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  // fontFamily: "";
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: blackColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  // fontFamily: "";
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


