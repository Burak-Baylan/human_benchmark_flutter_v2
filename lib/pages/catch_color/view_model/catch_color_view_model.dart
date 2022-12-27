import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import '../../../utils/injection_helper.dart';
import '../../result_page/result_page.dart';
import '../view/catch_color_view.dart';

part 'catch_color_view_model.g.dart';

class CatchColorViewModel = _CatchColorViewModelBase with _$CatchColorViewModel;

abstract class _CatchColorViewModelBase with Store {
  Random rnd = Random();
  Stopwatch stopWatch = Stopwatch();

  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';
  int get getTotalMs => totalMs ~/ 4;
  int totalMs = 0;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  @observable
  int levelCount = 1;

  @observable
  Color backgroundColor = Colors.white;

  @observable
  int selectedIndex = 0;

  @action
  void selectIndex() => selectedIndex = getRandomNumber();

  void play() {
    selectIndex();
    startCounter();
  }

  void reset() {
    levelCount = 1;
    selectedIndex = 0;
  }

  void nextLevel() {
    totalMs += stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    if (levelCount == 4) {
      Get.back();
      Get.to(goToResulPage);
      return;
    }
    play();
    levelCount++;
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: getTotalMs <= 390,
        showBadge: getTotalMs <= 350,
        tryAgainPressed: () {
          Get.to(CatchColorView());
          registerCatchColorViewModel();
        },
      );

  void userClicked(int index) {
    if (index == selectedIndex) {
      nextLevel();
      return;
    }
    wrongAnswerSignal();
  }

  Future<void> wrongAnswerSignal() async {
    selectWrongAnswerBackground();
    await Future.delayed(
      const Duration(milliseconds: 100),
      () => resetBackground(),
    );
  }

  void selectWrongAnswerBackground() => backgroundColor = Colors.redAccent;
  void resetBackground() => backgroundColor = Colors.white;

  int getRandomNumber([int from = 1, int to = 9]) =>
      rnd.nextInt(to - from) + from;
}
