import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ads/ads.dart';
import '../../../ads/controller/ads_controller.dart';
import '../../../helpers/colorful_print.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/timer.dart';
import '../../numbers_memory/pages/results_pages/wrong_answer_page.dart';
import '../../reaction_time/pages/info_page.dart';
import '../pages/game_page.dart';
import 'sequence_memory_value_controller.dart';

class SequenceMemoryController extends GetxController {
  SequenceMemoryValueController get sequenceMemoryValueController =>
      Get.find<SequenceMemoryValueController>();

  AdsController get adsController => Get.find<AdsController>();

  var page = 0.obs;
  var clickable = true;
  var backGroundColor = MyColors.myBlue.obs;

  List<Rx<Color>> cardColors = [
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
  ];

  List<Widget> pages = [
    InfoPage(),
    GamePage(),
    WrongAnswer(),
  ];

  selectInfoPage() => page.value = 0;
  selectGamePage() => page.value = 1;
  selectWrongAnswerPage() => page.value = 2;

  selectCorrectAnswerBackground() =>
      backGroundColor.value = MyColors.myLightBlue;
  resetBackground() => backGroundColor.value = MyColors.myBlue;

  selectWhiteCard(int index) => cardColors[index].value = Colors.white;
  selectTransparentCard(int index) =>
      cardColors[index].value = MyColors.transparentBlackForCard;

  loadInterstitialAd() {
    return;
    AdsController aC = adsController;
    //Ads.loadSeqMemoryWrongAnswerInterstitial(
    //  onAdLoaded: (ad) {
    //    ColorfulPrint.green('Loaded Interstitial ad');
    //    aC.sequenceMemoryInterstitialIsReady.value = true;
    //    aC.sequenceMemoryInterstitialAd.value = ad;
    //  },
    //  onAdFailedToLoad: (error) {
    //    ColorfulPrint.red('Load Interstitial ad error');
    //    aC.sequenceMemoryInterstitialIsReady.value = false;
    //  },
    //);
  }

  showAd() {
    return;
    AdsController aC = adsController;
    if (aC.sequenceMemoryInterstitialIsReady.value) {
      aC.lockSeqMemoryWrongAnswerInterstitial();
      aC.showAd(adsController.sequenceMemoryInterstitialAd.value);
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
