import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';

import '../helpers/colors.dart';

AppBar CustomAppBar(String text) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: Observer(builder: (_) {
      return LessText.lessFuturedText(
        text: text,
        color: MyColors.secondaryColor,
        fontSize: 25.sp,
        fontWeight: FontWeight.w300,
      );
    }),
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
