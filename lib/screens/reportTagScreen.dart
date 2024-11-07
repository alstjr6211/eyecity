import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eyecity/screens/aiAnalyzingScreen.dart';
import 'package:eyecity/screens/reportFinalScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eyecity/class/reportTagWidget.dart';
import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:image_picker/image_picker.dart';

import '../class/menuText.dart';
import '../constant/colors.dart';
import '../constant/icons.dart';

class ReportTagscreen extends StatefulWidget {

  final XFile? imageFile;

  ReportTagscreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  State<ReportTagscreen> createState() => _ReportTagscreenState();
}

class _ReportTagscreenState extends State<ReportTagscreen> {

  final TextEditingController searchTagController = TextEditingController();

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
              //TopContainerStart
              Container(
                height: _screenheight * 0.1,
                width: _screenwidth,
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
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
                        IconButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ReportAgreescreen()),
                            );
                            print('간편 제보하기 화면 뒤로가기 클릭됨');  //TODO debug print
                          },
                          icon: SvgPicture.asset(
                            leftarrow,
                            colorFilter: ColorFilter.mode(deepGrayColor, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(
                          width: _screenwidth * 0.05,
                        ),
                        MenutextReportTag(title: '간편 제보하기', subtitle: '제보 내용 작성하기', screenwidth: _screenwidth, screenheight: _screenheight,),
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
                    ),
                  ],
                ),
              ),
              //TopContainerEnd
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: _screenwidth,
                      height: _screenheight * 0.4,
                      decoration: BoxDecoration(
                        color: whiteColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: _screenwidth,
                            height: _screenheight * 0.4,
                            decoration: BoxDecoration(
                              color: whiteColor,
                            ),
                            child: widget.imageFile != null
                                ? Image.file(File(widget.imageFile!.path), fit: BoxFit.cover)
                                : Center(child: Text('이미지가 없습니다')),
                          ),
                          Container(
                            width: _screenwidth,
                            height: _screenheight * 0.1,
                            decoration: BoxDecoration(
                              color: whiteColor.withOpacity(0.7),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: _screenheight * 0.015,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text(
                                      '제보 사진을 확인해주세요.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 20,),
                                    Text(
                                      '제보 사진과 내용은 접수 후 수정, 삭제가 불가능하므로\n다시 확인하시고 신청해주시기 바랍니다.',
                                      style: TextStyle(
                                        // fontFamily: "";
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: _screenwidth,
                            height: _screenheight * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: _screenwidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: (){},
                                        child: Container(
                                          width: _screenwidth * 0.2,
                                          height: _screenheight * 0.035,
                                          decoration: BoxDecoration(
                                            color: mainColor_1,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadowColor.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                                '확정하기'
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: _screenwidth * 0.05,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: _screenheight * 0.025,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: _screenwidth,
                          height: _screenheight * 0.7,
                          decoration: BoxDecoration(
                            color: whiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Container(
                                      width: _screenwidth * 0.05,
                                      height: _screenwidth * 0.05,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(siren),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2,),
                                    Text('내용 작성하기'),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Text('운영 목적에 위배되는 제보는 사전 동의없이 삭제됩니다.'),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Text('제목'),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Container(
                                      width: _screenwidth * 0.8,
                                      height: _screenheight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: mainColor_1,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(10.0),
                                            hintText: '내용을 작성해주세요.(30자 이내)',
                                            hintStyle: TextStyle(
                                              color: grayColor,
                                            ),
                                          ),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(30),
                                          ],
                                        ), //TODO 제목 폼 제출
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Text('해시태그 설정'),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Container(
                                      width: _screenwidth * 0.5,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          width: 1.5,
                                          color: mainColor_1,
                                        ),
                                        color: whiteColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 35,
                                            height: 35,
                                            child: IconButton(
                                              onPressed: (){
                                              },
                                              icon: SvgPicture.asset(
                                                searchIcon,
                                                color: grayColor,
                                              ),
                                            ),
                                          ),
                                          Text('검색', style: TextStyle(color: grayColor),),
                                          SizedBox(width: 10,),
                                          Container(
                                            width: 1,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: grayColor,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: TextFormField(
                                              controller: searchTagController,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                prefixText: '#',
                                                prefixStyle: TextStyle(color: grayColor,),
                                                isDense: true,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [

                                    SizedBox(width: _screenwidth * 0.1,),
                                    TagTile('싱크홀'),
                                    SizedBox(width: 10,),
                                    TagTile('통행방해'),
                                    SizedBox(width: 10,),
                                    TagTile('대전'),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                              ),
                              Container(
                                width: _screenwidth,
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenwidth * 0.1,),
                                    Text('내용 작성'),
                                  ],
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => Reportfinalscreen()),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: whiteColor,
                                          side: BorderSide(color: mainColor_1, width: 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          '직접 작성하기',
                                          style: TextStyle(color: grayColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),

                                    SizedBox(
                                      width: 160,
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Aianalyzingscreen(imageFile: widget.imageFile),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: mainColor_1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          '자동 작성 AI 사용하기',
                                          style: TextStyle(color: whiteColor,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: _screenheight * 0.2,)
                            ],
                          ),
                        ),
                      ),
                    )
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
