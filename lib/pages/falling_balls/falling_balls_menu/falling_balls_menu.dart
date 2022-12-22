import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/falling_balls/view/falling_balls_view.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/button/custom_button_with_border.dart';
import '../../../widgets/text/less_futured_text.dart';

class FallingBallsMenu extends StatelessWidget {
  const FallingBallsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(''),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MyColors.secondaryColor,
            size: 25.w,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LessText.lessFuturedText(
                text: 'Falling Balls',
                color: MyColors.secondaryColor,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 5.h),
              LessText.lessFuturedText(
                text: 'Click the falling balls as fast as you can.',
                color: MyColors.secondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: 10.h),
              LessText.lessFuturedText(
                text: '(All wrong clicks add +1000ms)',
                color: MyColors.secondaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: 50.h),
              CustomButtonWithBorder(
                onPressed: () {
                  Get.back();
                  Get.to(FallingBallsView());
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
    );
  }
}
