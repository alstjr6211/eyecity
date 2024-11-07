import 'package:eyecity/constant/colors.dart';
import 'package:eyecity/constant/icons.dart';
import 'package:eyecity/screens/homeScreen.dart';
import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:eyecity/screens/reportTagScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Reportfinishscreen extends StatefulWidget {


  @override
  State<Reportfinishscreen> createState() => _ReportfinishscreenState();
}

class _ReportfinishscreenState extends State<Reportfinishscreen> {


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
          body: Container(
            width: _screenwidth,
            height: _screenheight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginScreenBackgroundImage),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Container(
              width: _screenwidth,
              height: _screenheight,
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: _screenwidth,
                    height: _screenheight * 0.1,
                    child: Center(
                      child:
                      Row(
                        children: [
                          SizedBox(width: _screenwidth * 0.05,),
                          IconButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Homescreen()),
                              );
                              print('뒤로가기');  //TODO debug print
                            },
                            icon: SvgPicture.asset(
                              leftarrow,
                              colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: _screenwidth * 0.25,
                          height: _screenwidth * 0.25,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: whiteColor,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                            size: _screenwidth * 0.2,
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
      ),
    );
  }
}
