import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter{

  static width(num v){
    return v.w;
  }
  static height(num v){
    return v.h;
  }
  static fontSize(num v){
    return v.sp;
  }
  static getScreenWidth(num v){
    // return ScreenUtil().screenWidth;
    return 1.sw;
  }
  static getScreenHeight(num v){
    // return ScreenUtil().screenHeight;
    return 1.sh;
  }
  static getStatusBarHeight(){
    return ScreenUtil().statusBarHeight;
  }
}