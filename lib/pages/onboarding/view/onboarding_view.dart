import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_slider/source/source.dart';
import 'package:lottie/lottie.dart';
import '../../../helpers/colors.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../home/home_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<IntroductionSliderItem> get list =>
      [firstPage, secondPage, thirdPage, fourthPage];

  IntroductionSliderItem get firstPage => IntroductionSliderItem(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Specially Designed Games',
              style: GoogleFonts.robotoCondensed(
                fontSize: 30.sp,
                color: MyColors.onboardingViewTitleColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
        subtitle: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Human Benchmark tests your ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'reflexes, hand-eye coordination',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'memory',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' with dozens of ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'specially designed games.',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        logo: SizedBox(
          width: context.width / 1.5,
          child: Lottie.asset('assets/lotties/gear_lottie.json'),
        ),
      );

  IntroductionSliderItem get secondPage => IntroductionSliderItem(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Work Smart Not Hard',
              style: GoogleFonts.robotoCondensed(
                fontSize: 30.sp,
                color: MyColors.onboardingViewTitleColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
        subtitle: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Repeating',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' the exercises ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'daily',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' will have a ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'positive',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' effect on your process.',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        logo: SizedBox(
          width: context.width / 1.5,
          child: Lottie.asset('assets/lotties/brain_lottie.json'),
        ),
      );

  IntroductionSliderItem get thirdPage => IntroductionSliderItem(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Fastest!',
              style: GoogleFonts.robotoCondensed(
                fontSize: 30.sp,
                color: MyColors.onboardingViewTitleColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
        subtitle: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Leave your old speed behind! ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Improve your memory',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'add positive impact',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' to ',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'real life',
                  style: GoogleFonts.robotoCondensed(
                    decoration: TextDecoration.underline,
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' with Human benchmark.',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20.sp,
                    color: MyColors.onboardingViewSubtitleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        logo: SizedBox(
          width: context.width / 1.5,
          child: Lottie.asset('assets/lotties/speed_lottie.json'),
        ),
      );

  IntroductionSliderItem get fourthPage => IntroductionSliderItem(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Gifts!',
              style: GoogleFonts.robotoCondensed(
                fontSize: 30.sp,
                color: MyColors.onboardingViewTitleColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
        subtitle: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'At the end of each game, you win one of them depending on your success.',
            style: GoogleFonts.robotoCondensed(
              fontSize: 20.sp,
              color: MyColors.onboardingViewSubtitleColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        logo: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
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
                      child: Lottie.asset(
                          'assets/lotties/congratulation_badge.json'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionSlider(
        showStatusBar: true,
        items: list,
        done: Done(
          animationDuration: const Duration(milliseconds: 400),
          child: Icon(
            Icons.check_rounded,
            size: 30.sp,
            color: MyColors.secondaryColor,
          ),
          home: HomePage(),
        ),
        dotIndicator: DotIndicator(
          size: 4,
          selectedColor: MyColors.secondaryColor,
          unselectedColor: MyColors.secondaryColor,
        ),
        next: Next(
          animationDuration: const Duration(milliseconds: 400),
          child: Icon(
            Icons.chevron_right_rounded,
            size: 30.sp,
            color: MyColors.secondaryColor,
          ),
        ),
        back: Back(
          animationDuration: const Duration(milliseconds: 400),
          child: Icon(
            Icons.chevron_left_rounded,
            size: 30.sp,
            color: MyColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
