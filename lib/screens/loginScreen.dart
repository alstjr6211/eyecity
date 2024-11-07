import 'package:eyecity/class/unimplemented.dart';
import 'package:eyecity/constant/colors.dart';
import 'package:eyecity/screens/homeScreen.dart';
import 'package:eyecity/screens/warningMapScreen.dart';
import 'package:flutter/material.dart';

import '../constant/icons.dart';

//TODO Login기능구현 필수

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  bool _isPasswordVisible = false;



  @override
  Widget build(BuildContext context) {
    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        width: _screenwidth,
        height: _screenheight,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: _screenwidth,
                height: _screenheight,
                child: Image(
                  image: AssetImage(loginScreenBackgroundImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Center(
                child: Container(
                  width: _screenwidth * 0.9,
                  height: _screenheight - (_screenwidth * 0.1),
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.45),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: _screenheight * 0.1),
                      Container(
                        width: _screenwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "EYE CITY",
                              style: TextStyle(
                                color: whiteColor,
                                decoration: TextDecoration.none,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: _screenwidth * 0.4,
                              child: Image(
                                image: AssetImage(logoWhite),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Watchful Eye",
                              style: TextStyle(
                                color: whiteColor,
                                decoration: TextDecoration.none,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenwidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "On The City",
                              style: TextStyle(
                                color: whiteColor,
                                decoration: TextDecoration.none,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: _screenheight * 0.07),
                      //ID 텍스트 필드
                      Container(
                        width: _screenwidth * 0.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "아이디",
                            hintStyle: TextStyle(color: whiteColor),
                            filled: true,
                            fillColor: whiteColor.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                      SizedBox(height: _screenheight * 0.025,),
                      //비밀번호 텍스트필드
                      Container(
                        width: _screenwidth * 0.8,
                        child: TextFormField(
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "비밀번호",
                            hintStyle: TextStyle(color: whiteColor),
                            filled: true,
                            fillColor: whiteColor.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: whiteColor.withOpacity(0.9),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          style: TextStyle(color: whiteColor),
                        ),
                      ),

                      SizedBox(height: _screenheight * 0.025,),

                      Container(
                        width: _screenwidth * 0.8,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Homescreen()),
                            );
                          },
                          child: Text(
                            "로그인",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),


                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              UnimplementedFeature();
                            },
                            child: Text(
                              "아이디 찾기",
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ),
                          Text(
                            '/',
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              UnimplementedFeature();
                            },
                            child: Text(
                              "비밀번호 찾기",
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ),
                          Text(
                            '/',
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              UnimplementedFeature();
                            },
                            child: Text(
                              "회원가입",
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ),
                        ],
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
