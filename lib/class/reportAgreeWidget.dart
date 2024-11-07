import 'package:flutter/material.dart';

import 'package:eyecity/constant/colors.dart';

Widget reportAgreeList(
    String require,
    String title,
    double screenwidth,
    bool value,
    Function(bool?) checkOnChanged,
    Function() textButtonOnPressed,
    ) {
  return Container(
    width: screenwidth * 0.9,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 10,),
            Checkbox(value: value, onChanged: checkOnChanged),
            const SizedBox(width: 10,),
            Text(require), //TODO style
            const SizedBox(width: 10,),
            Text(title), //TODO style
          ],
        ),
        Row(
          children: [
            TextButton(onPressed: textButtonOnPressed, child: const Text('보기')),
            const SizedBox(width: 10,),
          ],
        ),
      ],
    ),
  );
}

Widget reportDividor(double screenwidth) {
  return SizedBox(
    width: screenwidth * 0.85,
    child: Divider(
      color: mainColor_1,
      thickness: 2,
      height: 20,
    ),
  );
}