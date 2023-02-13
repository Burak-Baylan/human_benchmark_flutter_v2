import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import '../../../core/extensions/context_extension.dart';

class OnboardingTitleSubtitle extends StatelessWidget {
  const OnboardingTitleSubtitle({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.deviceWidth,
    this.subtitle,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final double deviceWidth;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: context.getWidth(0.03)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: MyColors.onboardingViewSubtitleColor,
                // 1024 for ipad pro 12.9 3rd gen
                fontSize: context.isIpad ? 15.sp : 35.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          subtitle != null
              ? AutoSizeText(
                  subtitle!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: MyColors.onboardingViewTitleColor,
                      // 1024 for ipad pro 12.9 3rd gen
                      fontSize: context.isIpad ? 7.5.sp : 18.sp,
                      fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
