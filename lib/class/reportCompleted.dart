import 'package:flutter/material.dart';
import 'package:eyecity/constant/colors.dart';

void ReportCompleted({
  required BuildContext context,
  required String title,
  required String imagePath,
  required String reportPersonId,
  required String subTitle,
  required String detail,
  required double screenwidth,
  required double screenheight,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: mainColor_1, width: 3),
        ),
        backgroundColor: whiteColor,
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //TODO style
        ),
        content: SizedBox(
          width: screenwidth * 0.7,
          height: screenheight * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenwidth * 0.6,
                    height: screenheight * 0.2,
                    decoration: BoxDecoration(
                      color: shadowColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(subTitle, style: TextStyle(fontSize: 16)), //TODO style
              SizedBox(height: 4),
              Text(
                "출처: 사용자 아이디 $reportPersonId님",
                style: TextStyle(color: Colors.grey, fontSize: 14), //TODO style
              ),
              SizedBox(height: 4),
              // detail 스크롤 설정
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    detail,
                    style: TextStyle(fontSize: 14), //TODO style
                  ),
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    print('더 알아보러 가기 클릭됨');
                  },
                  child: Container(
                    width: screenwidth * 0.7,
                    height: screenheight * 0.05,
                    decoration: BoxDecoration(
                      color: mainColor_1_withOpacity4,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: mainColor_1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '더 알아보러 가기', //TODO debug print
                        style: TextStyle(color: Colors.black, fontSize: 16),//TODO style
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
