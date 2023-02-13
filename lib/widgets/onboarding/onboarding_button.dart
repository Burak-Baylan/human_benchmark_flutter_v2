import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../tap_wrapper.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TapWrapper(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: context.isIpad ? 65.h : 55.h,
          width: 346.w,
          decoration: BoxDecoration(
              color: MyColors.onboardingViewSubtitleColor,
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            'Next',
            style: TextStyle(
              color: MyColors.myBlue,
              fontSize: context.isIpad ? 10.sp : 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
