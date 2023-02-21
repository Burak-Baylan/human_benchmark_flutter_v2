import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../ads/ad_manager.dart';
import '../helpers/colors.dart';
import '../helpers/get_storage_helper.dart';
import '../widgets/gifts_alert.dart';
import '../widgets/rate_us_sheet.dart';
import '../widgets/text/less_futured_text.dart';
import '../widgets/wait_rewarded_ad_alert.dart';
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

  bool seenOnboard = false;
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

  Future<void> showWaitRewardedAdAlert() async =>
      await WaitRewardedAdAlert.showWaitRewardedAdAlert(contextt);

  Future<void> showGiftsAlert() async =>
      await GiftsAlert.showGiftsAlert(contextt);

  bool isRateRequiesting = false;

  Future<void> requestRate(
      {bool showSheet = false, BuildContext? context}) async {
    if (isRateRequiesting) return;

    isRateRequiesting = true;

    final DateFormat formatter = DateFormat('yyyy MM dd');

    var now = DateTime.now();
    var dateStr = formatter.format(now);

    var ratingCountFromDb =
        GetStorageHelper.shared.read<int>("ratingRequestedCount") ?? 0;

    var dateStrFromDb =
        GetStorageHelper.shared.read<String>("requestDateString") ??
            formatter.format(DateTime.now());

    if (ratingCountFromDb >= 2) {
      if (dateStr != dateStrFromDb) {
        GetStorageHelper.shared.write(key: 'ratingRequestedCount', value: 1);
        GetStorageHelper.shared.write(key: "requestDateString", value: dateStr);
        await request(showSheet, context);
      }
      isRateRequiesting = false;
      return;
    }

    GetStorageHelper.shared.write(key: "requestDateString", value: dateStr);
    var int1 = ratingCountFromDb + 1;
    GetStorageHelper.shared.write(key: "ratingRequestedCount", value: int1);

    request(showSheet, context);
    isRateRequiesting = false;
  }

  Future<void> request(bool showSheet, BuildContext? context) async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      if (showSheet && !requestNativeRateState) {
        showRateUsSheet(contextt);
        updateRateSeencount();
        return;
      }
      updateRateSeencount();
      inAppReview.requestReview();
      return;
    }
  }

  void updateRateSeencount() {
    var count = getRateSeenCount;
    if ((count + 1) == 2) {
      setRequestNativeRateTrue();
      return;
    }
    setRateSeenCount(count + 1);
  }

  Future<void> setRequestNativeRateTrue() async =>
      await GetStorageHelper.shared.write(
        key: "requestNativeRate",
        value: true,
      );

  bool get requestNativeRateState =>
      GetStorageHelper.shared.read<bool>("requestNativeRate") ?? false;

  int get getRateSeenCount =>
      GetStorageHelper.shared.read<int>("rateSeenCount") ?? 0;

  Future<void> setRateSeenCount(int count) =>
      GetStorageHelper.shared.write(key: 'rateSeenCount', value: count);
}
