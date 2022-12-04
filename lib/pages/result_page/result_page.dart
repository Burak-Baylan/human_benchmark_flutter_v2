import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../core/extensions/context_extension.dart';
import '../../helpers/colors.dart';
import '../../widgets/button/custom_button_with_border.dart';
import '../../widgets/text/less_futured_text.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    Key? key,
    required this.title,
    required this.exp,
    required this.message,
    required this.tryAgainPressed,
  }) : super(key: key);

  String title;
  String exp;
  String message;
  Function tryAgainPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: LessText.lessFuturedText(
          text: 'Result',
          color: MyColors.secondaryColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(15.w),
              width: context.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: MyColors.secondaryColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    LessText.lessFuturedText(
                      text: title,
                      color: MyColors.secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(height: 15.h),
                    LessText.lessFuturedText(
                      text: exp,
                      color: MyColors.secondaryColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 15.h),
                    LessText.lessFuturedText(
                      text: message,
                      color: MyColors.secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButtonWithBorder(
                  onPressed: () => Get.back(),
                  text: 'Go to Home',
                  size: Size(context.width / 1.2, context.height / 17),
                  leading: Icon(
                    Icons.home,
                    size: 25.sp,
                    color: MyColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomButtonWithBorder(
                  onPressed: () {
                    Get.back();
                    tryAgainPressed();
                  },
                  text: 'Try Again',
                  size: Size(context.width / 1.2, context.height / 17),
                  leading: Icon(
                    Icons.restart_alt,
                    size: 25.sp,
                    color: MyColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
