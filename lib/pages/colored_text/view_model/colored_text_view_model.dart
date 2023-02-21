import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/values/const_values.dart';
import 'package:mobx/mobx.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../../utils/injection_helper.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
import '../view/colored_text_view.dart';

part 'colored_text_view_model.g.dart';

class ColoredTextViewModel = _ColoredTextViewModelBase
    with _$ColoredTextViewModel;

abstract class _ColoredTextViewModelBase with Store {
  Random rnd = Random();
  int trueRandomNumber = 0;
  String trueColorText = '';
  Color trueColor = Colors.blueAccent;
  int changeCount = 0;
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String wrongpageExp = 'You failed :(';
  String resultPageMessage = 'Try Again. You can do better.';
  int get getTotalMs => totalMs ~/ 4;
  int totalMs = 0;

  @observable
  int levelCount = 1;
  @observable
  Color changingColor = Colors.redAccent;
  @observable
  String changingText = '';

  bool canClick = false;
  bool userFailed = false;

  List<Color> colorList = [
    Colors.brown,
    Colors.green,
    Colors.redAccent,
    Colors.grey,
    Colors.blueAccent,
    Colors.black,
    Colors.purple,
  ];

  List<String> colorTexts = [
    'BROWN',
    'GREEN',
    'RED',
    'GREY',
    'BLUE',
    'BLACK',
    'PURPLE',
  ];

  Stopwatch stopWatch = Stopwatch();

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  void userClicked() {
    if (!canClick) {
      userFailed = true;
      goToResult();
      return;
    }
    if (levelCount == 4) {
      goToResult();
      return;
    }
    levelCount++;
    totalMs += stopWatch.elapsedMilliseconds;
    canClick = false;
    stopCounter();
    resetCounter();
    play();
  }

  void goToResult() {
    addToHistory();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_COLORED_TEXT_HIGH_SCORE,
      score: getTotalMs,
    );
    AdManager.showColoredTextAd();
    Get.back();
    Get.to(resultPageWidget);
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: '$getTotalMs ms',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_COLORED_TEXT_SCORES, model);
  }

  void play() {
    getTrueColorAndText();
    getChangeCount();
    startGame();
  }

  @action
  void changeColorAndText() {
    var rndNumber1 = getRandomNumber();
    bool canGetTrueRandomNumber = true;
    if (rndNumber1 == trueRandomNumber) {
      canGetTrueRandomNumber = false;
    }
    changingColor = colorList[rndNumber1];
    var rndNumber2 = getRandomNumber();
    if (rndNumber2 == rndNumber1) {
      changeColorAndText();
      return;
    }
    if (!canGetTrueRandomNumber && rndNumber2 == trueRandomNumber) {
      changeColorAndText();
      return;
    }
    changingText = colorTexts[rndNumber2];
  }

  late Timer _timer;

  void startGame() {
    const time = Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      time,
      (Timer timer) {
        if (changeCount == 0) {
          stopTimer();
          changingColor = trueColor;
          changingText = trueColorText;
          canClick = true;
          startCounter();
        } else {
          changeColorAndText();
          changeCount--;
        }
      },
    );
  }

  void stopTimer() => _timer.cancel();

  void getChangeCount() => changeCount = getRandomNumber(3, 9);

  void getTrueColorAndText() {
    trueRandomNumber = getRandomNumber();
    trueColorText = colorTexts[trueRandomNumber];
    trueColor = colorList[trueRandomNumber];
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: userFailed ? wrongpageExp : resultPageExp,
        message: resultPageMessage,
        showBadge: userFailed ? false : getTotalMs <= 340,
        showConfetti: userFailed ? false : getTotalMs <= 390,
        gameIndex: AppConstants.coloredTextGameIndex,
        tryAgainPressed: () {
          Get.to(ColoredTextView());
          registerColoredTextViewModel();
        },
      );

  int getRandomNumber([int from = 0, int to = 7]) =>
      rnd.nextInt(to - from) + from;
}
