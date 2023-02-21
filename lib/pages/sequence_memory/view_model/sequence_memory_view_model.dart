import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_constants.dart';
import 'package:human_benchmark_flutter_v2/helpers/high_score_comparator.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/values/const_values.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/colors.dart';
import '../../result_page/result_page.dart';
import '../helpers/card_selector.dart';
import '../helpers/sequencer.dart';
import '../view/sequence_memory_game_page.dart';
import '../view/info_page.dart';
import '../view/sequence_memory_wrong_answer_page.dart';

part 'sequence_memory_view_model.g.dart';

class SequenceMemoryViewModel = _SequenceMemoryViewModelBase
    with _$SequenceMemoryViewModel;

abstract class _SequenceMemoryViewModelBase with Store {
  @observable
  int page = 0;

  bool clickable = true;

  @action
  void closeClickable() => clickable = false;

  @action
  void openClickable() => clickable = true;

  @observable
  Color backGroundColor = Colors.white;

  @observable
  var cardColors = ObservableList<Color>.of([
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
    MyColors.transparentBlackForCard,
  ]);

  List<Widget> pages = [
    SequenceMemoryMenu(),
    SequenceMemoryGamePage(),
    SequenceMemoryWrongAnswerPage(),
  ];

  String resultPageTitle = 'Level';
  String get resultPageExp => 'Level $levelCount';
  String resultPageMessage = 'Try Again. You can do better.';

  Widget getStepWidget(bool isFilled) => Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 7),
        width: 10,
        height: 10,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10000),
          color: isFilled
              ? MyColors.secondaryColor
              : MyColors.transparentBlackForCard,
        ),
      );

  @action
  void selectInfoPage() => page = 0;
  @action
  void selectGamePage() => page = 1;
  @action
  void selectWrongAnswerPage() => page = 2;

  @action
  void selectCorrectAnswerBackground() =>
      backGroundColor = MyColors.myLightBlue;

  @action
  void resetBackground() => backGroundColor = Colors.white;

  void selectWhiteCard(int index) =>
      cardColors[index] = MyColors.secondaryColor;

  void selectTransparentCard(int index) =>
      cardColors[index] = MyColors.transparentBlackForCard;

  int levelCount = 1;

  @observable
  int userClickCounter = 0;

  @action
  void incrementUserClickCounter() => userClickCounter++;

  @action
  void resetUserClickCounter() => userClickCounter = 0;

  List<int> queue = [];
  List<int> userClickRow = [];

  @observable
  List<Widget> stepsWidget = ObservableList<Widget>.of([]);

  List<Widget> shadowStepsWidget = ObservableList<Widget>.of([]);

  void fillStepstWidget() {
    //shadowStepsWidget.clear();
    //stepsWidget.clear();
    //for (int i = 0; i < levelCount; i++) {
    //  shadowStepsWidget.add(getStepWidget(false));
    //}
    //shadowStepsWidget.reversed.toList();
    //stepsWidget = shadowStepsWidget;
  }

  void updateStepstWidget() {
    //int n = userClickCounter - 1;
    //shadowStepsWidget[n < 0 ? 0 : n] = getStepWidget(true);
    //stepsWidget = shadowStepsWidget;
  }

  void incrementLevel() => levelCount++;

  void resetCardColors() {
    for (int i = 0; i <= cardColors.length - 1; i++) {
      selectTransparentCard(i);
    }
  }

  void reset() {
    userClickRow.clear();
    resetUserClickCounter();
    resetCardColors();
  }

  void hardReset() {
    queue.clear();
    levelCount = 1;
    reset();
  }

  void play() {
    Sequencer.sequence();
    CardSelector.select();
    fillStepstWidget();
  }

  void userStepCheck(int index) {
    if (queue[userClickCounter] == index) {
      _correctStep();
      return;
    }
    _wrongAnswer();
  }

  void cardClickController(int index) {
    if (!clickable) return;
    userStepCheck(index);
  }

  void cardTapDown(int index) {
    if (!clickable) return;
    cardColors[index] = Colors.grey.shade400.withOpacity(.3);
  }

  void cardTapCancel(int index) {
    if (!clickable) return;
    cardColors[index] = MyColors.transparentBlackForCard;
  }

  void _correctStep() async {
    incrementUserClickCounter();
    updateStepstWidget();
    if (userClickCounter == levelCount) {
      _levelDoneSignal();
      reset();
      incrementLevel();
      play();
    }
  }

  Future<void> _levelDoneSignal() async {
    selectCorrectAnswerBackground();
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => resetBackground(),
    );
  }

  void _wrongAnswer() async {
    closeClickable();
    await showWrongCards();
    reset();
    sendToResultPage();
  }

  void sendToResultPage() {
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_SEQUENCE_MEMORY_HIGH_SCORE,
      score: levelCount,
      compareAsLower: false,
    );
    AdManager.showSequenceMemoryAd();
    Get.back();
    Get.to(resultPageWidget);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: levelCount >= 6,
        showBadge: levelCount >= 10,
        gameIndex: AppConstants.sequenceMemoryGameIndex,
        tryAgainPressed: () {
          Get.to(SequenceMemoryGamePage());
          registerSequenceMemoryViewmodel();
        },
      );

  Future<void> showWrongCards() async {
    for (int i = 0; i < (queue.length - userClickCounter); i++) {
      cardColors[queue[userClickCounter + i]] = MyColors.secondaryColor;
      await Future.delayed(const Duration(milliseconds: 300));
      cardColors[queue[userClickCounter + i]] =
          MyColors.transparentBlackForCard;
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  void loadInterstitialAd() {
    return;
    //AdsController aC = adsController;
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

  void showAd() {
    return;
    //AdsController aC = adsController;
    //if (aC.sequenceMemoryInterstitialIsReady.value) {
    //  aC.lockSeqMemoryWrongAnswerInterstitial();
    //  aC.showAd(adsController.sequenceMemoryInterstitialAd.value);
    //  MyTimer.startTimer(
    //    milliseconds: 120000,
    //    onFinished: () {
    //      loadInterstitialAd();
    //      adsController.unlockSeqMemoryWrongAnswerInterstitial();
    //    },
    //  );
    //}
  }
}
