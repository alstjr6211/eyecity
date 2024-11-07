import 'package:flutter/material.dart';
import 'package:eyecity/class/reportCompleted.dart';
import 'package:eyecity/constant/colors.dart';
import 'package:eyecity/class/menuText.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_svg/svg.dart';
import 'package:eyecity/main.dart';
import 'package:location/location.dart';

import '../constant/dummy/category.dart';
import '../constant/icons.dart';
import 'homeScreen.dart';









class WarningMapscreen extends StatefulWidget {
  const WarningMapscreen({super.key});

  @override
  State<WarningMapscreen> createState() => _WarningMapscreenState();
}

class _WarningMapscreenState extends State<WarningMapscreen> {

  List<Marker> _markers = [];
  Location location = Location();
  String? selectedProblemCategory;

  final TextEditingController _searchBarController = TextEditingController();

  //GOOGLE MAP관련
  late GoogleMapController mapController;
  LatLng? _center;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    if (_center != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(_center!),
      );
    }
  }

  Future<void> _getUserLocation() async {
    try {
      final userLocation = await location.getLocation();
      setState(() {
        _center = LatLng(userLocation.latitude!, userLocation.longitude!);
        _markers.add(
          Marker(
            markerId: MarkerId('currentUserLocation'),
            position: _center!,
            infoWindow: InfoWindow(title: '현재 위치'),
          ),
        );
        print('현재 위치 마커 추가됨');
      });
    } catch (e) {
      print('위치 정보를 가져오는 데 실패했습니다: $e');
    }
  }

  void searchButtonClicked() {
    String inputText =  _searchBarController.text.trim();

    if (inputText.isNotEmpty) {
      setState(() {
        print('검색버튼 클릭됨 $inputText');
      });
    } else {
      print('검색어가 없음');
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: (){
          ReportCompleted(
            context: context,
            title: '가로수 쓰러짐 사고',
            imagePath: dummyImage,
            reportPersonId: 'jungoo1537',
            subTitle: '태풍 영향 : 가로수 쓰러짐',
            detail: '어쩌구저쩌구 네가 발로 차서 떨어진거임 사실 그런데 그냥 태풍때문에 떨어진척하는거니까 더 이상 말걸지마셈', //TODO dummydata
            screenwidth: 400,
            screenheight: 800,
          );
        },
        position: LatLng(36.369479331514135, 127.34577688772151)));
    _markers.add(Marker(
        markerId: MarkerId("공대 1호관 뒷편"),
        draggable: true,
        onTap: (){
          ReportCompleted(
            context: context,
            title: '가로수 쓰러짐 사고',
            imagePath: dummyImage,
            reportPersonId: 'jungoo1537',
            subTitle: '태풍 영향 : 가로수 쓰러짐',
            detail: '어쩌구저쩌구 네가 발로 차서 떨어진거임 사실 그런데 그냥 태풍때문에 떨어진척하는거니까 더 이상 말걸지마셈', //TODO dummydata
            screenwidth: 400,
            screenheight: 800,
          );
        },
        position: LatLng(36.36811892921242, 127.34408829077886,)));
  }



  @override
  Widget build(BuildContext context) {

    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Container(
        color: whiteColor,
        child: Scaffold(
          backgroundColor: whiteColor,
          body: _center == null
            ? Center(child: CircularProgressIndicator(),) : Container(
            child: Stack(
              children: [
                //최상위 컨테이너에 구글맵이 들어가야함
                Positioned.fill(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center!,
                      zoom: 18.0,
                    ),
                    markers: Set.from(_markers),
                    myLocationButtonEnabled: false,
                  ),
                ),
                //상단 컨테이너(메뉴 바)
                Column(
                  children: [
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
                                  print('위험지도 화면 뒤로가기 클릭됨');  //TODO debug print
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
                                  title : '위험 지도',
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
                    // 상단 컨테이너 끝

                    //search 바
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: _screenheight * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: _screenwidth * 0.8,
                                height: _screenheight * 0.06,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(
                                    color: mainColor_1,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowColor,
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [ //TODO MAP페이지 검색창 (근데 뭘 검색하는거임)
                                    const SizedBox(width: 10,),
                                    Container(
                                      width: _screenwidth * 0.08,
                                      height: _screenheight * 0.05,
                                      child: IconButton(
                                        onPressed: (){
                                          searchButtonClicked();
                                        },
                                        icon: SvgPicture.asset(
                                          searchIcon,
                                          color: deepGrayColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _searchBarController,
                                        decoration: InputDecoration(
                                          hintText: '대전광역시 유성구 대학로 99',
                                          hintStyle: TextStyle(
                                            color: mapSearchBarInnerTextColor,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(
                                      width: _screenwidth * 0.24,
                                      height: _screenheight * 0.06,
                                      decoration: BoxDecoration(
                                        color: mainColor_1_withOpacity4,
                                        border: Border(
                                          left: BorderSide(color: mainColor_1, width: 2),
                                        ),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            '카테고리',
                                            style: TextStyle(color: mapSearchBarInnerTextColor,),
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down, // 화살표 아이콘
                                            color: mapSearchBarInnerTextColor,
                                          ),
                                          underline: SizedBox(),
                                          style: TextStyle(color: mapSearchBarInnerTextColor, fontSize: 16),
                                          value: selectedProblemCategory,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedProblemCategory = newValue;
                                            });
                                          },
                                          items: problemCategories.map<DropdownMenuItem<String>>((String category) {
                                            return DropdownMenuItem<String>(
                                              value: category,
                                              child: Text(category),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //seraching 바 end
                  ],
                ), // Top
              ],
            ),
          ),
        ),
      ),
    );
  }
}
