import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/core/app_constants.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import '../../core/extensions/context_extension.dart';

Future<void> showSorryHearThatSheet(BuildContext context) async {
  Widget buildButton({
    required String text,
    required Color color,
    required Function onTap,
  }) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          left: 35.w,
          right: 35.w,
          top: 12.w,
          bottom: 12.w,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          wordSpacing: -0.6.sp,
          letterSpacing: -0.8.sp,
        ),
      ),
    );
  }

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.h),
          Text(
            'Sorry to Hear That',
            style: TextStyle(
              color: MyColors.blackBackground,
              fontSize: context.isIpad ? 27.sp : 30.sp,
              fontWeight: FontWeight.w500,
              wordSpacing: -0.6.sp,
              letterSpacing: -0.8.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Would you like to give us your feedbacks? We’d do anything to improve your ${AppConstants.APP_NAME} experience.',
            style: TextStyle(
              color: MyColors.blackBackground,
              fontSize: context.isIpad ? 14.sp : 17.sp,
              wordSpacing: -0.6.sp,
              letterSpacing: -0.8.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                onTap: () => context.closeDialog(),
                text: 'Not Now',
                color: MyColors.sorryToHearThatNotNowButtonBackground,
              ),
              buildButton(
                onTap: () {
                  //launchLink('mailto:${AppConstants.EMAIL_ADDRESS}');
                  context.closeDialog();
                },
                text: 'Sure',
                color: MyColors.onboardingViewSubtitleColor,
              ),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      );
    },
  );
}
