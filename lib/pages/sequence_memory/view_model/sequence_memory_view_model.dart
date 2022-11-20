import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/colors.dart';
import '../helpers/card_selector.dart';
import '../helpers/sequencer.dart';
import '../view/game_page.dart';
import '../view/info_page.dart';
import '../view/wrong_answer_page.dart';

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
  Color backGroundColor = MyColors.myBlue;

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
    InfoPage(),
    GamePage(),
    WrongAnswer(),
  ];

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
  void resetBackground() => backGroundColor = MyColors.myBlue;

  void selectWhiteCard(int index) => cardColors[index] = Colors.white;

  void selectTransparentCard(int index) =>
      cardColors[index] = MyColors.transparentBlackForCard;

  int _levelCounter = 1;
  int get levelCount => _levelCounter;
  int _userClickCounter = 0;

  List<int> queue = [];
  List<int> userClickRow = [];

  void incrementLevel() => _levelCounter++;

  void resetCardColors(){
    for (int i = 0; i <= cardColors.length - 1; i++) {
      selectTransparentCard(i);
    }
  }

  void reset() {
    userClickRow.clear();
    _userClickCounter = 0;
    resetCardColors();
  }

  void hardReset() {
    queue.clear();
    _levelCounter = 1;
    reset();
  }

  void play() {
    Sequencer.sequence();
    CardSelector.select();
  }

  void userStepCheck(int index) {
    if (queue[_userClickCounter] == index) {
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
    _userClickCounter++;
    if (_userClickCounter == levelCount) {
      _levelDoneSignal();
      reset();
      incrementLevel();
      play();
    }
  }

  Future<void> _levelDoneSignal() async {
    await Future.delayed(const Duration(milliseconds: 200),
        () => selectCorrectAnswerBackground());
    await Future.delayed(
        const Duration(milliseconds: 200), () => resetBackground());
  }

  void _wrongAnswer() {
    reset();
    selectWrongAnswerPage();
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
