import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';
import '../../../utils/injection_helper.dart';
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
    if (!msDone) wrongClick = true;
    dispose();
    Get.back();
    Get.to(goToResulPage);
  }

  void setSecond() => milliseconds = getRandomNumber(1000, 5000);

  void dispose() {
    _timer.cancel();
    stopCounter();
  }

  int getRandomNumber([int from = 1, int to = 9]) =>
      random.nextInt(to - from) + from;

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: wrongClick ? wrongResulPageExp : resultPageExp,
        message: resultPageMessage,
        tryAgainPressed: () {
          Get.to(VibrationView());
          registerVibrationViewModel();
        },
      );

  String resultPageTitle = 'Fast Fingers';
  String get resultPageExp => '$clickMs milliseconds';
  String get wrongResulPageExp => 'Too Soon';
  String resultPageMessage = 'Try Again. You can do better.';

  void vibrate() => Vibration.vibrate();
}
