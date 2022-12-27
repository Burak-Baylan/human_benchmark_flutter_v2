import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/hold_and_click/view/hold_and_click_view.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';

import '../../result_page/result_page.dart';

part 'hold_and_click_view_model.g.dart';

class HoldAndClickViewModel = _HoldAndClickViewModelBase
    with _$HoldAndClickViewModel;

abstract class _HoldAndClickViewModelBase with Store {
  @observable
  int coloredBoxIndex = 10;
  @observable
  Color backgroundColor = Colors.white;

  final int holdDuration = 300;
  int holdCounter = 0;

  bool gameDurationDone = false;

  late Timer globalTimer;
  Random rnd = Random();

  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';

  int totalMs = 0;
  int extraMs = 0;

  @observable
  int levelCount = 1;

  @observable
  bool fingerHolding = false;

  Stopwatch stopWatch = Stopwatch();

  @observable
  bool isAlertOpen = false;

  int get getTotalMs => (totalMs + extraMs) ~/ 4;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  void play(UserHoldState state) {
    holdCounter = 0;
    gameDurationDone = false;
    userHolding(state);
  }

  void userClicked(int index) {
    if (fingerHolding){
      isAlertOpen = true;
      return;
    }
    isAlertOpen = false;
    if (index != coloredBoxIndex) {
      wrongAnswerSignal();
      extraMs += 1000;
      return;
    }
    correctAnswerSignal();
    resetColors();
    totalMs += stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    if (levelCount == 4) {
      Get.back();
      Get.to(goToResulPage);
      return;
    }
    levelCount++;
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: getTotalMs <= 650,
        showBadge: getTotalMs <= 570,
        tryAgainPressed: () {
          Get.to(const HoldAndClickView());
          registerHoldAndClickViewModel();
        },
      );

  void resetColors() => coloredBoxIndex = 10;

  void startGlobalTimer() {
    const time = Duration(milliseconds: 1);
    globalTimer = Timer.periodic(
      time,
      (Timer timer) {
        if (holdDuration == holdCounter) {
          giveColorToRandomBox();
          gameDurationDone = true;
          globalTimer.cancel();
          startCounter();
          return;
        }
        holdCounter++;
      },
    );
  }

  void selectBox() {}

  void giveColorToRandomBox() => coloredBoxIndex = getRandomIndex();

  void userHolding(UserHoldState state) {
    switch (state) {
      case UserHoldState.FINGER_DOWN:
        print('FINGER DOWNN');
        startGlobalTimer();
        fingerHolding = true;
        break;
      case UserHoldState.FINGER_UP:
        print('FINGER UP');
        fingerHolding = false;
        if (gameDurationDone) return;
        globalTimer.cancel();
        break;
    }
  }

  Future<void> wrongAnswerSignal() async {
    backgroundColor = Colors.redAccent.withOpacity(.7);
    await Future.delayed(const Duration(milliseconds: 50));
    backgroundColor = Colors.white;
  }

  Future<void> correctAnswerSignal() async {
    backgroundColor = Colors.greenAccent.withOpacity(.7);
    await Future.delayed(const Duration(milliseconds: 50));
    backgroundColor = Colors.white;
  }

  int getRandomIndex([int from = 0, int to = 4]) =>
      rnd.nextInt(to - from) + from;
}

enum UserHoldState { FINGER_DOWN, FINGER_UP }
