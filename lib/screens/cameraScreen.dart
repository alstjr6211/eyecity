import 'package:camera/camera.dart';
import 'package:eyecity/constant/colors.dart';
import 'package:eyecity/screens/homeScreen.dart';
import 'package:eyecity/screens/reportAgreeScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


import 'package:eyecity/main.dart';



import '../constant/icons.dart';

class Camerascreen extends StatefulWidget {
  const Camerascreen({super.key});

  @override
  State<Camerascreen> createState() => _CamerascreenState();
}

class _CamerascreenState extends State<Camerascreen> {

  late final List<CameraDescription> cameras;



  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );

    try {
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final image = await _cameraController!.takePicture();

        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await File(image.path).copy(imagePath);

        print("Image saved at: $imagePath");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ReportAgreescreen()),
        );
      } catch (e) {
        print('Error capturing picture: $e');
      }
      try {
        final XFile file = await _cameraController!.takePicture();

        Directory directory = Directory('storage/emulated/0/DCIM/EYECITY');

        await Directory(directory.path).create(recursive: true);

        await File(file.path).copy('${directory.path}/${file.name}');
        print('${directory.path}/${file.name}');
      } catch (e) {
        print('Error taking picture: $e');
      }
    }


  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
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
          color: blackColor,
        ),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: _screenwidth,
                height: _screenheight * 0.1,
                decoration: BoxDecoration(
                  color: mainColor_1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.settings, color: whiteColor),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.flash_on, color: whiteColor),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.camera, color: whiteColor),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.photo, color: whiteColor),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.help, color: whiteColor),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.sync, color: whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Expanded(
                  child: _isCameraInitialized
                      ? CameraPreview(_cameraController!)
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
              Container(
                width: _screenwidth,
                height: _screenheight * 0.25,
                decoration: BoxDecoration(
                  color: mainColor_1,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "촬영 TIP",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "위험요소의 전체 모습을 담아주세요.",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: _screenwidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: _screenwidth * 0.06,),
                                  Text(
                                    "필요하다면 여러 장을 촬영해주세요.",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            _takePicture();
                            //TODO camera찍기

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
                    Container(
                      width: _screenwidth,
                      height: _screenheight * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Homescreen()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: mainColor_2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  '취소하기',
                                  style: TextStyle(color: whiteColor,),
                                ),
                              ),
                              SizedBox(width: _screenwidth * 0.05,)
                            ],
                          ),
                          SizedBox(height: _screenwidth * 0.05,)
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
    );
  }
}
