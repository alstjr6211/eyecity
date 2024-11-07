import 'package:eyecity/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eyecity/constant/colors.dart';
import 'package:eyecity/constant/icons.dart';
import 'package:eyecity/screens/reportTagScreen.dart';
import 'package:image_picker/image_picker.dart';

import '../class/menuText.dart';
import 'package:eyecity/class/reportAgreeWidget.dart';
import 'package:eyecity/main.dart';

class ReportAgreescreen extends StatefulWidget {
  const ReportAgreescreen({super.key});

  @override
  State<ReportAgreescreen> createState() => _ReportAgreescreenState();
}

class _ReportAgreescreenState extends State<ReportAgreescreen> {

  bool value = false;

  late String phoneNum = '${dummyUser.phoneNumber}';
  late String userName = '${dummyUser.name}';

  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedFile;
    });
  }

  void toggleCheckbox(bool? newValue) {
    setState(() {
      value = newValue ?? false;
    });
  }

  void notImplemented() {
    print('Not implemented!');
  } //TODO 눌러야함


  @override
  Widget build(BuildContext context) {
    // UserInfo 초기화 관련 변수
    String phoneMiddle = phoneNum.length >= 7 ? phoneNum.substring(3, 7) : '';
    String phoneLast = phoneNum.length >= 11 ? phoneNum.substring(7, 11) : '';

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
                              MaterialPageRoute(builder: (context) => Homescreen()),
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
                        Menutext(
                            title : '간편 제보하기',
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
                child: Container(
                  width: _screenwidth,
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: _screenwidth * 0.1,),
                              Text('약관 동의'),
                            ],
                          ),
                          reportAgreeList('[필수]', '개인정보 수집 및 이용동의서', _screenwidth, value, toggleCheckbox, notImplemented),
                          reportAgreeList('[필수]', '위치정보 수집 및 이용동의서', _screenwidth, value, toggleCheckbox, notImplemented),
                          Row(
                            children: [
                              SizedBox(width: _screenwidth * 0.1,),
                              Text('기본 정보 작성'),
                            ],
                          ),
                          reportDividor(_screenwidth),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: _screenwidth * 0.1,),
                              Text('이름'),
                              SizedBox(width: _screenwidth * 0.05,),
                              Container(
                                width: _screenwidth * 0.24,
                                height: _screenheight * 0.04,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteGrayColor,
                                ),
                                child: Center(
                                  child: Text(userName),
                                ),
                              ),
                              SizedBox(width: _screenwidth * 0.05,),
                              Text('주소'),
                              SizedBox(width: _screenwidth * 0.05,),
                              Container(
                                width: _screenwidth * 0.3,
                                height: _screenheight * 0.04,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: _screenwidth * 0.15,
                                      height: _screenheight * 0.04,
                                      child: Center(
                                        child: const Text('대전광역..'),
                                      ),
                                      decoration: BoxDecoration(
                                          color: whiteGrayColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            bottomLeft: Radius.circular(7),
                                          )
                                      ),
                                    ),
                                    Container(
                                      width: _screenwidth * 0.15 - 3,
                                      height: _screenheight * 0.04,
                                      decoration: BoxDecoration(
                                        color: mainColor_1_withOpacity4,
                                        border: Border(
                                          left: BorderSide(color: mainColor_1, width: 1.5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text('주소찾기'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          reportDividor(_screenwidth),
                          Row(
                            children: [
                              SizedBox(width: _screenwidth * 0.1,),
                              Text('연락처'),
                              const SizedBox(width: 20,),
                              Container(
                                width: _screenwidth * 0.14,
                                height: _screenheight * 0.04,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteGrayColor,
                                ),
                                child: const Center(
                                  child: Text('010'),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text('-'),
                              SizedBox(width: 5,),
                              Container(
                                width: _screenwidth * 0.14,
                                height: _screenheight * 0.04,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteGrayColor,
                                ),
                                child: Center(
                                  child: Text(phoneMiddle),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text('-'),
                              SizedBox(width: 5,),

                              Container(
                                width: _screenwidth * 0.14,
                                height: _screenheight * 0.04,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteGrayColor,
                                ),
                                child: Center(
                                  child: Text(phoneLast),
                                ),
                              ),


                            ],
                          ),
                          reportDividor(_screenwidth),
                          Row(
                            children: [
                              SizedBox(width: _screenwidth * 0.1,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('제보 사진 추가하기'),
                                ],
                              ),
                              SizedBox(width: _screenwidth * 0.15,),

                              GestureDetector(
                                onTap: (){
                                  print('클릭됨');
                                  pickImage();
                                },
                                child: Container(
                                  width: _screenwidth * 0.4,
                                  height: _screenheight * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: mainColor_1,                               width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: SvgPicture.asset(
                                            addImageIcon,
                                            color: whiteGrayColor,
                                          ),
                                        ),
                                        Text('클릭하여 업로드하기',
                                          style: TextStyle(
                                            color: whiteGrayColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          reportDividor(_screenwidth),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportTagscreen(imageFile: _selectedImage!),
                                    ),
                                  );
                                  //TODO navigator
                                },
                                child: Container(
                                  width: _screenwidth * 0.16,
                                  height:  _screenheight * 0.05,
                                  decoration: BoxDecoration(
                                    color: mainColor_1,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '다음',
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _screenwidth * 0.1,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
