import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ads/controller/ads_controller.dart';
import '../../../helpers/timer.dart';
import '../pages/ask_number_page.dart';
import '../pages/hint_page.dart';
import '../pages/results_pages/correct_answer_page.dart';
import '../pages/results_pages/wrong_answer_page.dart';
import '../pages/show_number_page.dart';
import 'number_memory_value_controller.dart';

class NumbersMemoryController extends GetxController {
  NumbersMemoryValueController get valueController =>
      Get.find<NumbersMemoryValueController>();

  AdsController get adsController => Get.find<AdsController>();

  var page = 0.obs;

  bool protectedFocusLost = false;
  bool onShowNumberPage = false;

  List<Widget> pages = [
    HintPage(),
    ShowNumber(),
    AskNumber(),
    CorrectAnswer(),
    WrongAnswer(),
  ];

  void selectHintPage() => page.value = 0;

  void selectShowNumberPage() => page.value = 1;

  void selectAskNumberPage() => page.value = 2;

  void selectCorrectAnswerPage() => page.value = 3;

  void selectWrongAnswerPage() => page.value = 4;

  reset() {
    page.value = 0;
    valueController.reset();
    protectedFocusLost = false;
    onShowNumberPage = false;
  }

  loadInterstitialAd() {
    return;
    //AdsController aC = adsController;
    //Ads.loadSeqMemoryWrongAnswerInterstitial(
    //  onAdLoaded: (ad) {
    //    ColorfulPrint.green('Loaded Interstitial ad');
    //    aC.numMemoryInterstitialIsReady.value = true;
    //    aC.numMemoryInterstitialAd.value = ad;
    //  },
    //  onAdFailedToLoad: (error) {
    //    ColorfulPrint.red('Load Interstitial ad error: \n $error');
    //    aC.numMemoryInterstitialIsReady.value = false;
    //  },
    //);
  }

  showAd() {
    return;
    AdsController aC = adsController;
    if (aC.numMemoryInterstitialIsReady.value) {
      aC.lockSeqMemoryWrongAnswerInterstitial();
      aC.showAd(adsController.numMemoryInterstitialAd.value);
      MyTimer.startTimer(
        milliseconds: 120000,
        onFinished: () {
          loadInterstitialAd();
          adsController.unlockSeqMemoryWrongAnswerInterstitial();
        },
      );
    }
  }
}
