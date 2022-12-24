import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/visual_memory/view/visual_memory_view.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';

import '../../result_page/result_page.dart';
part 'visual_memory_view_model.g.dart';

class VisualMemoryViewModel = _VisualMemoryViewModelBase
    with _$VisualMemoryViewModel;

abstract class _VisualMemoryViewModelBase with Store {
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';
  Random rnd = Random();

  @observable
  var dotsLocations = ObservableList<int>.of([]);

  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => (totalMs + extraMs) ~/ 4;

  int totalMs = 0;
  int extraMs = 0;

  @observable
  var openedBoxes = ObservableList<int>.of([]);

  @observable
  bool isBoxesOpen = true;

  late Timer globalTimer;

  final int roundLatency = 550;
  int counter = 0;

  @observable
  Color backgroundColor = Colors.white;

  @observable
  int levelCount = 1;

  int stepCount = 1;

  @observable
  bool isNextRoundTextOpen = false;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  void startTimer() {
    const time = Duration(milliseconds: 1);
    globalTimer = Timer.periodic(
      time,
      (Timer timer) {
        if (roundLatency == counter) {
          closeAllBoxes();
          globalTimer.cancel();
          startCounter();
          return;
        }
        counter++;
      },
    );
  }

  Future<void> userClicked(int index) async {
    openBox(index);
    if (!dotsLocations.contains(index)) {
      wrongAnswerSignal();
      extraMs += 1000;
      return;
    }
    correctAnswerSignal();
    await Future.delayed(const Duration(milliseconds: 300));
    stepCount++;
    if (stepCount == 4) {
      if (levelCount == 4) {
        Get.back();
        Get.to(goToResulPage);
        return;
      }
      levelCount++;
      totalMs += stopWatch.elapsedMilliseconds;
      stopCounter();
      resetCounter();
      await nextRoundSignal();
      play();
    }
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        tryAgainPressed: () {
          Get.to(VisualMemoryView());
          registerVisualMemoryViewModel();
        },
      );

  Future<void> nextRoundSignal() async {
    isNextRoundTextOpen = true;
    await Future.delayed(const Duration(milliseconds: 300));
    isNextRoundTextOpen = false;
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> wrongAnswerSignal() async {
    backgroundColor = Colors.redAccent.withOpacity(.4);
    await Future.delayed(const Duration(milliseconds: 100));
    backgroundColor = Colors.white;
  }

  Future<void> correctAnswerSignal() async {
    backgroundColor = Colors.greenAccent.withOpacity(.2);
    await Future.delayed(const Duration(milliseconds: 100));
    backgroundColor = Colors.white;
  }

  void closeAllBoxes() => openedBoxes.clear();

  void openBox(int index) => openedBoxes.add(index);

  void resetOpenedBoxes() => openedBoxes.clear();

  void play() {
    stepCount = 0;
    counter = 0;
    setDotLocations();
    openAllBoxes();
    startTimer();
  }

  void openAllBoxes() {
    for (var i = 0; i < 16; i++) {
      openedBoxes.add(i);
    }
  }

  void setDotLocations() {
    dotsLocations.clear();
    for (var i = 0; i < 4; i++) {
      setDotLocation();
    }
  }

  void setDotLocation() {
    var index = getRandomNumber();
    if (dotsLocations.contains(index)) {
      setDotLocation();
      return;
    }
    dotsLocations.add(index);
  }

  int getRandomNumber([int from = 0, int to = 16]) =>
      rnd.nextInt(to - from) + from;
}