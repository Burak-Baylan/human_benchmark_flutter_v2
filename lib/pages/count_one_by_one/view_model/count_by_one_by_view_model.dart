import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/injection_helper.dart';
import '../../result_page/result_page.dart';
import '../view/count_one_by_one.dart';

part 'count_by_one_by_view_model.g.dart';

class CountOneByOneViewModel = _CountOneByOneViewModelBase
    with _$CountOneByOneViewModel;

abstract class _CountOneByOneViewModelBase with Store {
  List<int> numbersList = [];
  Random rnd = Random();

  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';

  int get getTotalMs => stopWatch.elapsedMilliseconds + extraMs;
  int extraMs = 0;

  @observable
  Color backgroundColor = Colors.white;

  Stopwatch stopWatch = Stopwatch();

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  @observable
  int levelCount = 1;

  void play() {
    fillNumbersList();
    startCounter();
  }

  @action
  void userClick(String number) {
    if (levelCount.toString() == number) {
      levelCount++;
      correctAnswerSignal();
      if (levelCount == 17) {
        gameDone();
        return;
      }
      return;
    }
    wrongAnswerSignal();
    extraMs += 1000;
  }

  void gameDone() {
    Get.back();
    Get.to(resultPageWidget);;
    stopCounter();
    resetCounter();
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showBadge: getTotalMs <= 9000,
        showConfetti: getTotalMs <= 11000,
        tryAgainPressed: () {
          Get.to(const CountOneByOneView());
          registerCountOneByOneViewModel();
        },
      );

  void fillNumbersList() {
    for (var i = 1; i <= 16; i++) {
      numbersList.add(i);
    }
  }

  @action
  Future<void> wrongAnswerSignal() async {
    backgroundColor = Colors.redAccent.withOpacity(.4);
    await Future.delayed(const Duration(milliseconds: 300));
    backgroundColor = Colors.white;
  }

  @action
  Future<void> correctAnswerSignal() async {
    backgroundColor = Colors.greenAccent.withOpacity(.4);
    await Future.delayed(const Duration(milliseconds: 100));
    backgroundColor = Colors.white;
  }

  int getNumber() {
    int rndNum = rnd.nextInt(numbersList.length);
    int number = numbersList[rndNum];
    numbersList.removeAt(rndNum);
    return number;
  }

  int getRandomNumber([int from = 0, int to = 17]) =>
      rnd.nextInt(to - from) + from;
}
