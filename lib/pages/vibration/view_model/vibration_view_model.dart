import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../../utils/injection_helper.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
import '../view/vibration_view.dart';

part 'vibration_view_model.g.dart';

class VibrationViewModel = _VibrationViewModelBase with _$VibrationViewModel;

abstract class _VibrationViewModelBase with Store {
  late Timer _timer;

  int milliseconds = 0;
  Random random = Random();

  Stopwatch stopWatch = Stopwatch();

  bool msDone = false;
  bool wrongClick = false;

  int get clickMs => stopWatch.elapsedMilliseconds;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  @action
  void startTimer() {
    Duration oneMs = const Duration(milliseconds: 1);
    _timer = Timer.periodic(
      oneMs,
      (Timer timer) {
        if (milliseconds == 0) {
          msDone = true;
          timer.cancel();
          vibrate();
          startCounter();
        } else {
          milliseconds--;
        }
      },
    );
  }

  void play() {
    setSecond();
    startTimer();
  }

  void userClicked() {
    stopCounter();
    if (!msDone) wrongClick = true;
    dispose();
    goToResult();
  }

  void goToResult() {
    addToHistory();
    AdManager.showVibrationAd();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_VIBRATION_HIGH_SCORE,
      score: clickMs,
    );
    Get.back();
    Get.to(resultPageWidget);
  }

  void setSecond() => milliseconds = getRandomNumber(1000, 5000);

  void dispose() {
    _timer.cancel();
    stopCounter();
  }

  int getRandomNumber([int from = 1, int to = 9]) =>
      random.nextInt(to - from) + from;

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: '$clickMs ms',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_VIBRATION_SCORES, model);
  }

  Widget get resultPageWidget {
    return ResultPage(
      title: resultPageTitle,
      exp: wrongClick ? wrongResulPageExp : resultPageExp,
      message: resultPageMessage,
      showBadge: wrongClick ? false : clickMs <= 400,
      showConfetti: wrongClick ? false : clickMs <= 500,
      tryAgainPressed: () {
        Get.to(VibrationView());
        registerVibrationViewModel();
      },
    );
  }

  String resultPageTitle = 'Fast Fingers';
  String get resultPageExp => '$clickMs milliseconds';
  String get wrongResulPageExp => 'Too Soon :(';
  String resultPageMessage = 'Try Again. You can do better.';

  void vibrate() {
    try {
      Vibration.vibrate();
    } catch (e) {}
  }
}
