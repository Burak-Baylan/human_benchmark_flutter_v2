import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/button/custom_button_with_border.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../view/blind_numbers_view.dart';

class BlindNumbersMenu extends StatefulWidget {
  BlindNumbersMenu({Key? key}) : super(key: key);

  @override
  State<BlindNumbersMenu> createState() => _BlindNumbersMenuState();
}

class _BlindNumbersMenuState extends State<BlindNumbersMenu> {
  int aimCellCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MyColors.secondaryColor,
            size: 25.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LessText.lessFuturedText(
                    text: 'Blind Numbers',
                    color: MyColors.secondaryColor,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 5.h),
                  LessText.lessFuturedText(
                    text: 'Try to click the numbers in order!',
                    color: MyColors.secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(height: 5.h),
                  LessText.lessFuturedText(
                    text: '(All wrong clicks add +1000 ms)',
                    color: MyColors.secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(height: 50.h),
                  CustomButtonWithBorder(
                    onPressed: () {
                      Get.back();
                      Get.to(const BlindNumbersView());
                    },
                    text: 'Play',
                    leading: Icon(
                      Icons.play_arrow_rounded,
                      size: 25.sp,
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
