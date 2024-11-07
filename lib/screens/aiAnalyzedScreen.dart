import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../class/menuText.dart';
import '../constant/colors.dart';
import '../constant/icons.dart';

class Aianalyzedscreen extends StatefulWidget {
  final List<String> detectedClasses;

  const Aianalyzedscreen({super.key, required this.detectedClasses});

  @override
  State<Aianalyzedscreen> createState() => _AianalyzedscreenState();
}

class _AianalyzedscreenState extends State<Aianalyzedscreen> {
  late String text;

  @override
  void initState() {
    super.initState();
    text = widget.detectedClasses.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        width: _screenwidth,
        height: _screenheight,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: _screenheight * 0.1,
                width: _screenwidth,
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: _screenwidth * 0.05),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportAgreescreen()),
                            );
                          },
                          icon: SvgPicture.asset(
                            leftarrow,
                            colorFilter: ColorFilter.mode(deepGrayColor, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(width: _screenwidth * 0.05),
                        MenutextReportTag(
                          title: '간편 제보하기',
                          subtitle: '자동 작성 AI',
                          screenwidth: _screenwidth,
                          screenheight: _screenheight,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            menuIcon,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: _screenwidth,
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: _screenwidth * 0.2,
                        height: _screenwidth * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage(appIcon),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenwidth * 0.8,
                        height: _screenheight * 0.3,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: mainColor_1.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '분석 완료!',
                            style: TextStyle(
                              color: mainColor_1,
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '내용에 적용하시겠습니까?',
                            style: TextStyle(
                              color: mainColor_1,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // 적용하기 버튼의 기능 구현
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: mainColor_1, backgroundColor: whiteColor,
                                side: BorderSide(color: mainColor_1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                minimumSize: Size(160, 50),
                                elevation: 2,
                              ),
                              child: Text('적용하기'),
                            ),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                // 다시 생성 버튼의 기능 구현
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: whiteColor, backgroundColor: mainColor_1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                minimumSize: Size(160, 50),
                                elevation: 2,
                              ),
                              child: Text('다시 생성'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: _screenwidth,
                height: _screenheight * 0.15,
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: _screenheight * 0.1,
                          height: _screenheight * 0.1,
                          child: Image(
                            image: AssetImage(cityIcon),
                          ),
                        ),
                        SizedBox(width: _screenwidth * 0.1),
                      ],
                    ),
                    Container(
                      width: _screenwidth,
                      height: _screenheight * 0.05,
                      decoration: BoxDecoration(
                        color: mainColor_1,
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
  }
}
