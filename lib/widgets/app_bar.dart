import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../helpers/colors.dart';
import 'text/less_futured_text.dart';

AppBar CustomAppBar(String text) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: LessText.lessFuturedText(
      text: text,
      color: MyColors.secondaryColor,
      fontSize: 25.sp,
      fontWeight: FontWeight.w300,
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: MyColors.secondaryColor,
        size: 25.w,
      ),
      onPressed: () => Get.back(),
    ),
  );
}
