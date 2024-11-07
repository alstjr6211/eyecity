import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:eyecity/screens/warningMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../class/menuText.dart';
import '../constant/colors.dart';
import '../constant/icons.dart';
import '../main.dart';
import 'cameraScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  late String userName = '${dummyUser.name}';

  //constant
  int reportCount = 6;
  int servicetimeCount = 5;
  int waitAccpetCount = 2;
  int paymentDuetime = 0;


  @override
  Widget build(BuildContext context) {
    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        width: _screenwidth,
        color: whiteColor,
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TopContainerStart
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
                        SizedBox(
                          width: _screenwidth * 0.05,
                        ),

                        Container(
                          width: _screenwidth * 0.1,
                          height: _screenwidth * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: whiteColor,
                            image: DecorationImage(
                              image: AssetImage(
                                appIcon,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: _screenwidth * 0.05,
                        ),
                        Menutext(
                            title : 'EYE CITY ',
                            screenwidth: 0),
                      ],
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: (){
                            print('메뉴 아이콘 클릭됨');  //TODO debug print
                          },
                          icon: SvgPicture.asset(
                            menuIcon,
                            color: blackColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //TopContainerEnd
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: _screenwidth,
                    height: _screenheight * 0.74,
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        //TOP Column
                        Column(
                          children: [
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "우리 동네 신규 제보",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),

                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _screenwidth * 0.88,
                                    height: _screenheight * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: mainColor_1.withOpacity(0.8),
                                        width: 2,
                                      ),
                                      color: whiteColor,
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.red,
                                          ),
                                        ),
                                        Container(
                                          width: _screenwidth * 0.88,
                                          height: _screenheight * 0.06,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: _screenheight * 0.04,
                                                height: _screenheight * 0.04,
                                                child: Image(image: AssetImage(megaphone)),
                                              ),
                                              Container(
                                                width: _screenwidth * 0.15,
                                                height: _screenheight * 0.04,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: whiteGrayColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: whiteColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: shadowColor.withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text('우리집'),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('신규 제보 '),
                                                  Text('6'),
                                                  Text('건 접수'),
                                                ],
                                              ),
                                              SizedBox(width: 0,),
                                              TextButton(onPressed: (){}, child: Text('>')),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //middle

                        Column(
                          children: [
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "안전지도",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),

                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _screenwidth * 0.88,
                                    height: _screenheight * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: mainColor_1.withOpacity(0.8),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadowColor.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                          homeGlassImage,
                                        ),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      color: blackColor.withOpacity(0.9),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: _screenwidth * 0.82,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "SAFE MAP",
                                                style: TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: _screenwidth * 0.82,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(width: _screenwidth * 0.5,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "도시 곳곳의 위험 요소를",
                                                          style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),),
                                                  Container(width: _screenwidth * 0.5,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "지도를 통해 확인해보세요.",
                                                          style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => WarningMapscreen()),
                                                  );
                                                },
                                                child: Container(
                                                  width: _screenwidth * 0.16,
                                                  height: _screenwidth * 0.16,
                                                  decoration: BoxDecoration(
                                                    color: grayColor.withOpacity(0.6),
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: whiteColor,
                                                    size: _screenwidth * 0.1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //last

                        Column(
                          children: [
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "마이페이지",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),

                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _screenwidth * 0.88,
                                    height: _screenheight * 0.16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadowColor.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      color: mainColor_2,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: _screenwidth * 0.88,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "$userName(님)의 EYE",
                                                style: TextStyle(
                                                  color: blackColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(width: _screenwidth * 0.3,),
                                              TextButton(
                                                onPressed: (){//TODO mypage로 넘어가기
                                                },
                                                child: Text('자세히보기 >',
                                                  style: TextStyle(
                                                    color: grayColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: _screenwidth * 0.8,
                                          height: _screenheight * 0.1,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: whiteColor,
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: _screenwidth * 0.7,
                                              height: _screenheight * 0.07,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: _screenwidth * 0.35,
                                                    height: _screenheight * 0.07,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: _screenwidth * 0.35,
                                                          child: Row(
                                                            children: [
                                                              Text('제보횟수 : $reportCount 건',
                                                                style: TextStyle(
                                                                  color: grayColor,
                                                                ),),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: _screenwidth * 0.35,
                                                          child: Row(
                                                            children: [
                                                              Text('승인 대기 중 : $waitAccpetCount 건',
                                                                style: TextStyle(
                                                                  color: grayColor,
                                                                ),),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: _screenwidth * 0.35,
                                                    height: _screenheight * 0.07,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: _screenwidth * 0.35,
                                                          child: Row(
                                                            children: [
                                                              Text('총 봉사시간 : $servicetimeCount 시간',
                                                                style: TextStyle(
                                                                  color: grayColor,
                                                                ),),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: _screenwidth * 0.35,
                                                          child: Row(
                                                            children: [
                                                              Text('지급 예정 : $paymentDuetime 시간',
                                                                style: TextStyle(
                                                                  color: grayColor,
                                                                ),),
                                                            ],
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: _screenheight * 0.04,),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: _screenwidth,
                height: _screenheight * 0.16,
                decoration: BoxDecoration(
                  color: mainColor_1,
                  image: DecorationImage(
                    image: AssetImage(homeCamera),
                    fit: BoxFit.fitWidth,
                  )
                ),
                child: Container(
                  width: _screenwidth,
                  height: _screenheight * 0.16,
                  decoration: BoxDecoration(
                    color: mainColor_1.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: _screenwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: _screenwidth * 0.02,),
                            Text(
                              "촬영하고 제보하기",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Camerascreen()),
                          );
                        },
                        child: Container(
                          width: _screenheight * 0.11,
                          height: _screenheight * 0.11,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cameraButton),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
