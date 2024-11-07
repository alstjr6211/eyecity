import 'package:eyecity/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';


void UnimplementedFeature() {
  Fluttertoast.showToast(
    msg: "미구현 기능입니다",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: whiteGrayColor,
    textColor: whiteColor,
    fontSize: 16.0,
  );
}