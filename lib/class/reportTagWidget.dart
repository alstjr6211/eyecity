import 'package:flutter/material.dart';
import 'package:eyecity/constant/colors.dart';

Widget TagTile(String text) {
  return Container(
    width: 100,
    height: 36,
    decoration: BoxDecoration(
      border: Border.all(
        color: mainColor_1,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(12.0),
      color: mainColor_1_withOpacity4,
    ),
    child: Center(
      child: Row(
        children: [
          SizedBox(width: 10,),
          Text(
            text,
            style: TextStyle(
              color: grayColor,
            ),
          ),
          SizedBox(width: 10,),
          Icon(Icons.close,
            color: grayColor,),
        ],
      ),
    ),
  );
}