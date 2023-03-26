import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'colors.dart';

Future<void> showYouUnlockedNextGameAlert(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.only(top: 10.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        titleTextStyle: _titleTextStyle(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Unlocked!', style: _titleTextStyle()),
            LottieBuilder.asset(
              'assets/lotties/unlocked_lottie.json',
              width: 40.h,
            ),
          ],
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Congratulations. You unlocked next game!',
                style: _titleTextStyle().copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.onboardingViewTitleColor,
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              color: MyColors.onboardingViewTitleColor,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                onTap: () =>
                    Navigator.of(context, rootNavigator: true).pop('dialog'),
                child: Container(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Text(
                    "Close",
                    style: _titleTextStyle().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
      );
    },
  );
}

TextStyle _titleTextStyle() {
  return TextStyle(
    fontSize: 17.sp,
    color: MyColors.onboardingViewSubtitleColor,
    fontWeight: FontWeight.w600,
  );
}
