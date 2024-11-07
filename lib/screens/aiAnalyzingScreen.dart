import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'aiAnalyzedScreen.dart';
import 'reportAgreeScreen.dart';
import '../class/menuText.dart';
import '../constant/colors.dart';
import '../constant/icons.dart';

class Aianalyzingscreen extends StatefulWidget {
  final XFile? imageFile;

  Aianalyzingscreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  State<Aianalyzingscreen> createState() => _AianalyzingscreenState();
}

class _AianalyzingscreenState extends State<Aianalyzingscreen> {
  @override
  void initState() {
    super.initState();
    // 서버로 이미지 업로드 및 분석 요청
    if (widget.imageFile != null) {
      uploadImage(widget.imageFile!);
    }
  }

  Future<void> uploadImage(XFile imageFile) async {
    try {
      Uint8List imageBytes = await imageFile.readAsBytes();
      var request = http.MultipartRequest('POST', Uri.parse('SERVER_ADDRESS'));

      request.files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: imageFile.name,
      ));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        print('Server response: ${responseData.body}');

        var result = jsonDecode(responseData.body);
        List<String> detectedClasses = List<String>.from(result['detected_class']);

        // 서버 응답을 성공적으로 받은 후 화면 전환
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Aianalyzedscreen(detectedClasses: detectedClasses),
          ),
        );
      } else {
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during image upload: $e');
    }
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
              // 상단 UI 영역
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
                              MaterialPageRoute(builder: (context) => ReportAgreescreen()),
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
                    IconButton(
                      onPressed: () {
                        print('메뉴 아이콘 클릭됨');
                      },
                      icon: SvgPicture.asset(
                        menuIcon,
                        color: blackColor,
                      ),
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
                        width: _screenwidth * 0.4,
                        height: _screenwidth * 0.4,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'AI가 분석중이에요.',
                            style: TextStyle(
                              color: mainColor_1,
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '잠시만 기다려 주세요!',
                            style: TextStyle(
                              color: mainColor_1,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: _screenwidth * 0.2,
                        height: _screenwidth * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(loading),
                          ),
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
