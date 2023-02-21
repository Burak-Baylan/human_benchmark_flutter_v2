import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import 'package:human_benchmark_flutter_v2/widgets/sorry_to_hear_that_sheet.dart';
import 'package:in_app_review/in_app_review.dart';
import '../../core/extensions/context_extension.dart';
import '../core/app_constants.dart';
import '../main.dart';
import 'tap_wrapper.dart';

Future<void> showRateUsSheet(BuildContext context) async {
  try {
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
              'Rate Us',
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
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Text(
                'We made ${AppConstants.APP_NAME} completely free for everyone. If you appreciate our effort. You can rate us. How is your experience with wime so far?',
                style: TextStyle(
                  color: MyColors.blackBackground,
                  fontSize: context.isIpad ? 14.sp : 17.sp,
                  wordSpacing: -0.6.sp,
                  letterSpacing: -0.8.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TapWrapper(
                  onTap: () {
                    context.closeDialog();
                    showSorryHearThatSheet(context);
                  },
                  child: Image.asset(
                    'assets/png/sad_image.png',
                    width: 100.w,
                    height: 100.w,
                  ),
                ),
                TapWrapper(
                  onTap: () async {
                    context.closeDialog();
                    await mainVm.setRequestNativeRateTrue();
                    InAppReview.instance.requestReview();
                  },
                  child: Image.asset(
                    'assets/png/smile_image.png',
                    width: 100.w,
                    height: 100.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
          ],
        );
      },
    );
  } catch (e) {}
}
