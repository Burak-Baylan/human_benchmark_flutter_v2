import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/core/extensions/context_extension.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';
import 'package:lottie/lottie.dart';

import '../helpers/colors.dart';

class GiftsAlert {
  static Future<void> showGiftsAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: LessText.lessFuturedText(
          text: 'Gifts',
          color: MyColors.secondaryColor,
        ),
        content: _giftsWidget(context),
        actions: [
          InkWell(
            splashColor: MyColors.onboardingViewTitleColor.withOpacity(.3),
            highlightColor: MyColors.onboardingViewTitleColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: LessText.lessFuturedText(
                text: 'Close',
                color: MyColors.secondaryColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _giftsWidget(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Normal',
                  color: MyColors.secondaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  width: context.width / 2,
                  child: Lottie.asset('assets/lotties/normal_lottie.json'),
                ),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Good',
                  color: MyColors.secondaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  width: context.width / 2,
                  child: Lottie.asset('assets/lotties/confetti.json'),
                ),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Very Good',
                  color: MyColors.secondaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  width: context.width / 2,
                  child:
                      Lottie.asset('assets/lotties/congratulation_badge.json'),
                ),
              ],
            ),
          ),
        ],
      );
}
