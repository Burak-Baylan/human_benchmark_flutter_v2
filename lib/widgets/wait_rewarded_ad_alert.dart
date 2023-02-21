import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';

import '../helpers/colors.dart';
import '../main.dart';

class WaitRewardedAdAlert {
  static Future<void> showWaitRewardedAdAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: LessText.lessFuturedText(
          text: 'Please Wait',
          color: MyColors.secondaryColor,
        ),
        content: LessText.lessFuturedText(
          text:
              'Please wait a few seconds until the rewarded ad loading or avoid waiting.',
          color: MyColors.secondaryColor,
          fontSize: 14.sp,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
        ),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: MyColors.secondaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 5.w),
                  LessText.lessFuturedText(
                    text: 'Wait',
                    color: MyColors.secondaryColor,
                    fontSize: 14.sp,
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: MyColors.onboardingViewTitleColor.withOpacity(.3),
            highlightColor: MyColors.onboardingViewTitleColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.pop(context);
              mainVm.sendToPaywall();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.workspace_premium_outlined,
                    color: MyColors.onboardingViewTitleColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 5.w),
                  LessText.lessFuturedText(
                    text: 'GET PREMIUM',
                    color: MyColors.onboardingViewTitleColor,
                    fontSize: 14.sp,
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
