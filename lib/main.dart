import 'package:eyecity/constant/icons.dart';
import 'package:eyecity/screens/aiAnalyzedScreen.dart';
import 'package:eyecity/screens/aiAnalyzingScreen.dart';
import 'package:eyecity/screens/cameraScreen.dart';
import 'package:eyecity/screens/homeScreen.dart';
import 'package:eyecity/screens/loginScreen.dart';
import 'package:eyecity/screens/reportFinishScreen.dart';
import 'package:eyecity/screens/warningMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:eyecity/screens/warningMapScreen.dart';
import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:eyecity/screens/reportTagScreen.dart';
import 'package:camera/camera.dart';
import 'package:eyecity/constant/dummy/userInfo.dart';



late UserInfo dummyUser;
List<CameraDescription> cameras_ = [];

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  cameras_ = await availableCameras();
  //UserInfo 생성
  dummyUser = UserInfo(
    userId: 'admin',
    uid: '34324234234223423SEFSDFSDFSE',
    phoneNumber: '01012345678',
    name: '박상우',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'EYECITY',
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
    );
  }
}