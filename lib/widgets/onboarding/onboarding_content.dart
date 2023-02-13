import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:human_benchmark_flutter_v2/helpers/colors.dart';
import 'package:human_benchmark_flutter_v2/widgets/text/less_futured_text.dart';
import 'package:lottie/lottie.dart';
import '../../../core/extensions/context_extension.dart';
import '../../pages/onboarding_paywall/view/onboarding_paywall_view.dart';
import 'onboarding_title_subtitle.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    Key? key,
    required this.isOnboardingPaywall,
    required this.title,
    required this.imageAsset,
    this.subtitle,
    required this.deviceWidth,
    required this.pageController,
    required this.with3Image,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String? imageAsset;
  final double deviceWidth;
  final PageController pageController;
  final bool isOnboardingPaywall;
  final bool with3Image;

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  Widget build(BuildContext context) {
    return widget.isOnboardingPaywall
        ? OnboardingPaywallView()
        : FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: OnboardingTitleSubtitle(
                        title: widget.title,
                        subtitle: widget.subtitle,
                        deviceWidth: widget.deviceWidth,
                        imageAsset: widget.imageAsset!,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: widget.with3Image ? 60.h : 20.h),
                Center(
                  child: widget.with3Image
                      ? SizedBox(
                          width: context.width,
                          child: with3ImageWidget,
                        )
                      : Lottie.asset(
                          widget.imageAsset!,
                          alignment: Alignment.center,
                          width: context.width / 1.5,
                        ),
                ),
              ],
            ),
          );
  }

  Widget get with3ImageWidget => Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Normal',
                  color: MyColors.secondaryColor,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  width: context.width / 2,
                  child: Lottie.asset('assets/lotties/normal_lottie.json'),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Good',
                  color: MyColors.secondaryColor,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  width: context.width / 2,
                  child: Lottie.asset('assets/lotties/confetti.json'),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LessText.lessFuturedText(
                  text: 'Very Good',
                  color: MyColors.secondaryColor,
                  fontSize: 20.sp,
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
