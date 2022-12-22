import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/color_cell_count/view/color_cell_count_view.dart';
import '../menu/color_cell_count_menu.dart';
import '../../../utils/injection_helper.dart';
import 'package:mobx/mobx.dart';
import '../../result_page/result_page.dart';
part 'color_cell_count_view_model.g.dart';

class ColorCellCountViewModel = _ColorCellCountViewModelBase
    with _$ColorCellCountViewModel;

abstract class _ColorCellCountViewModelBase with Store {
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => (totalMs ~/ 4) + extraMs;

  int totalMs = 0;
  int extraMs = 0;

  @observable
  var colorList = ObservableList<Color>.of([]);

  int greenCellCount = 0;

  Random rnd = Random();

  @observable
  var answers = ObservableList<int>.of([]);

  @observable
  Color backgroundColor = Colors.white;

  @observable
  int levelCount = 1;

  void play() {
    fillColorList();
    createAnswers();
    startCounter();
  }

  @action
  void fillColorList() {
    colorList.clear();
    fillListDefault();
    greenCellCount = getRandomNumber(3);
    List<int> randomIndexes = [];
    for (var i = 0; i < greenCellCount; i++) {
      int cellIndex = getIndexForGreenCell(randomIndexes);
      randomIndexes.add(cellIndex);
      colorList[cellIndex] = Colors.cyan;
    }
  }

  void fillListDefault() {
    for (var i = 0; i < 16; i++) {
      colorList.add(Colors.white);
    }
  }

  @action
  void userClicked(int index) {
    if (answers[index] == greenCellCount) {
      correctAnswerSignal();
      stopCounter();
      totalMs += stopWatch.elapsedMilliseconds;
      resetCounter();
      if (levelCount == 4) {
        sendToResultPage();
        return;
      }
      play();
      levelCount++;
      return;
    }
    extraMs += 1000;
    wrongAnswerSignal();
  }

  void sendToResultPage() {
    Get.back();
    Get.to(goToResulPage);
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        tryAgainPressed: () {
          Get.to(ColorCellCountView());
          registerColorCellCountViewModel();
        },
      );

  void createAnswers() {
    answers.clear();
    int correctAnswerIndex = getRandomNumber(0, 3);
    for (var i = 0; i < 3; i++) {
      var answer = getAnAnswer(i);
      answers.add(answer);
    }
    answers[correctAnswerIndex] = greenCellCount;
  }

  int getAnAnswer(int index) {
    switch (index) {
      case 0:
        return greenCellCount - 1;
      case 1:
        return greenCellCount + 1;
      case 2:
        return greenCellCount + 2;
      default:
        return greenCellCount - 1;
    }
  }

  Future<void> wrongAnswerSignal() async {
    backgroundColor = Colors.redAccent.withOpacity(.4);
    await Future.delayed(const Duration(milliseconds: 300));
    backgroundColor = Colors.white;
  }

  Future<void> correctAnswerSignal() async {
    backgroundColor = Colors.greenAccent.withOpacity(.2);
    await Future.delayed(const Duration(milliseconds: 300));
    backgroundColor = Colors.white;
  }

  int getIndexForGreenCell(List<int> randomIndexes) {
    int cellIndex = getRandomNumber();
    if (randomIndexes.contains(cellIndex)) {
      return getIndexForGreenCell(randomIndexes);
    }
    return cellIndex;
  }

  int getRandomNumber([int from = 0, int to = 16]) =>
      rnd.nextInt(to - from) + from;
}