import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_constants.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_manager.dart';
import '../../../../../../core/extensions/context_extension.dart';
import '../../../helpers/colors.dart';
import '../../../main.dart';
import '../../../utils/injection_helper.dart';
import '../../home/home_page.dart';
import '../view_model/onboarding_paywall_view_model.dart';

class OnboardingPaywallView extends StatefulWidget {
  OnboardingPaywallView({super.key});

  @override
  State<OnboardingPaywallView> createState() => _OnboardingPaywallViewState();
}

class _OnboardingPaywallViewState extends State<OnboardingPaywallView> {
  OnboardingPaywallViewModel onboardingPaywallVm =
      getit<OnboardingPaywallViewModel>();

  @override
  void initState() {
    //onboardingPaywallVm.startPageView();
    super.initState();
  }

  List<String> comments = [
    '“This app is phenomenal, these games are really specially designed and I really feel the effects in my real life.”',
    '“There are very nice games in the app, I can feel the improvement in my reflexes.“',
    '“I can feel the improvement in my hand-eye coordination and memory!“',
  ];

  List<String> commentOwners = ['LibbyBee', 'MurphyGlory', 'FisherFish'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: closeButton()),
                topTexts(),
                SizedBox(height: 50.h),
                featureRow('Access to 15+ games'),
                SizedBox(height: 15.h),
                featureRow('Remove Ads'),
                SizedBox(height: 15.h),
                featureRow('See your game history'),
                SizedBox(height: 15.h),
                featureRow('Access to all features'),
                SizedBox(height: 60.h),
                ratingsWidget(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget closeButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () async {
          //await GetStorageHelper.shared
          //    .write(key: AppKeys.seenOnboard, value: true);

          await HiveManager.putData(HiveConstants.BOX_APP_PREFERENCES, true,
              HiveConstants.seenOnboard);
          //mainVm.seenOnboard = true;
          mainVm.onboardJustCompleted = true;
          Get.offAll(HomePage());
        },
        icon: Icon(
          Icons.close,
          color: const Color(0xff858584),
          size: 25.sp,
        ),
      ),
    );
  }

  Widget ratingsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          SizedBox(
            height: 160.sp,
            child: PageView(
              controller: onboardingPaywallVm.pageController,
              children: [rateWidget(0), rateWidget(1), rateWidget(2)],
              onPageChanged: (index) =>
                  onboardingPaywallVm.changePageViewIndex(index),
            ),
          ),
          SizedBox(height: 5.h),
          Observer(builder: (context) {
            return pageViewDots(onboardingPaywallVm.currentPageViewIndex);
          }),
        ],
      ),
    );
  }

  Widget pageViewDots(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7.sp,
          height: 7.sp,
          decoration: getDecoration(index == 0),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 7.sp,
          height: 7.sp,
          decoration: getDecoration(index == 1),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 7.sp,
          height: 7.sp,
          decoration: getDecoration(index == 2),
        ),
      ],
    );
  }

  BoxDecoration getDecoration(bool isColorWhite) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(9999),
      color: isColorWhite ? MyColors.onboardingViewSubtitleColor : Colors.grey,
    );
  }

  Widget rateWidget(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        starsWidget(false),
        SizedBox(height: 25.h),
        rateText(comments[index]),
        SizedBox(height: 33.h),
        Text(
          commentOwners[index],
          style: TextStyle(
            color: MyColors.onboardingViewSubtitleColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }

  Widget starsWidget(bool isHalf) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        starWidget(),
        starWidget(),
        starWidget(),
        starWidget(),
        starWidget(half: isHalf)
      ],
    );
  }

  Widget starWidget({bool half = false}) {
    return Icon(
      half ? Icons.star_half : Icons.star_rate_rounded,
      color: Color(0xffEEB811),
      size: 18.w,
    );
  }

  Widget rateText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.01)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: MyColors.onboardingViewSubtitleColor,
          fontSize: context.isIpad ? 14.sp : 16.sp,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget featureRow(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.w),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: Colors.green,
            size: context.isIpad ? 25.sp : 35.sp,
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: MyColors.onboardingViewSubtitleColor,
                fontSize: context.isIpad ? 17.sp : 22.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topTexts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Unlock Everything!',
            style: TextStyle(
              color: MyColors.onboardingViewSubtitleColor,
              fontSize: context.isIpad ? 30.sp : 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.isIpad ? 10.h : 5.h),
          Text(
            'Special Offer. Only available between ${onboardingPaywallVm.getDateStr}',
            style: TextStyle(
              color: MyColors.numbersMemorySemiDarkBlue,
              fontSize: context.isIpad ? 15.sp : 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
