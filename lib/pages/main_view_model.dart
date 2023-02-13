import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import '../helpers/colors.dart';
import '../widgets/text/less_futured_text.dart';
import 'paywall/view/paywall_view.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  late BuildContext contextt;

  @observable
  var unlockedGames = ObservableList<int>.of([0, 1, 2, 3]);

  @observable
  bool isPurchaseChecked = false;

  @observable
  bool onboardJustCompleted = false;

  @observable
  bool isPremium = false;

  void setContext(BuildContext context) => contextt = context;

  void addToUnlockedGames(int index) => unlockedGames.add(index);

  void sendToPaywall() {
    if (isPremium) return;

    if (onboardJustCompleted) {
      onboardJustCompleted = false;
      return;
    }
    Get.to(const PaywallView());
  }

  void showUnlockOrBuyDiaog(int index) {
    showDialog(
      context: contextt,
      builder: (context) => AlertDialog(
        title: LessText.lessFuturedText(
          text: 'Unlock Game',
          color: MyColors.secondaryColor,
        ),
        content: LessText.lessFuturedText(
          text:
              'You need to pass the previous level with an above average score.\n'
              '\nAlso you can watch a short video to unlock the game or you can get premium to unlock all levels.',
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
              AdManager.showRewardedInterstitialAd(index);
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
                    text: 'Open With Ad',
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
              sendToPaywall();
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

  Future<void> showWaitRewardedAdAlert() async {
    await showDialog(
      context: contextt,
      builder: (context) => AlertDialog(
        title: LessText.lessFuturedText(
          text: 'Please Wait',
          color: MyColors.secondaryColor,
        ),
        content: LessText.lessFuturedText(
          text:
              'Please wait a few seconds until the rewarded ad loading or avoid waiting',
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
              sendToPaywall();
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

  Future<void> showGiftsAlert() async {
    showDialog(
      context: contextt,
      builder: (context) => AlertDialog(
        title: LessText.lessFuturedText(
          text: 'Gifts',
          color: MyColors.secondaryColor,
        ),
        content: giftsWidget,
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

  Widget get giftsWidget => Row(
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
                  width: contextt.width / 2,
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
                  width: contextt.width / 2,
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
                  width: contextt.width / 2,
                  child:
                      Lottie.asset('assets/lotties/congratulation_badge.json'),
                ),
              ],
            ),
          ),
        ],
      );
}
