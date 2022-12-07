import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/colorful_print.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../result_page/result_page.dart';
import '../view/find_number_view.dart';
part 'find_number_view_model.g.dart';

class FindNumberViewModel = _FindNumberViewModelBase with _$FindNumberViewModel;

abstract class _FindNumberViewModelBase with Store {
  var rng = Random();
  bool lock = false;
  List<int> numbers = [];
  int totalMs = 0;
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';
  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => totalMs ~/ 4;

  @observable
  var numberList = ObservableList<int>.of([]);
  @observable
  int randomNumber = 0;
  @observable
  String randomNumberText = '';
  @observable
  int levelCount = 1;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  @action
  void updateRandomNumberString() {
    switch (randomNumber) {
      case 0:
        randomNumberText = 'ZERO';
        break;
      case 1:
        randomNumberText = 'ONE';
        break;
      case 2:
        randomNumberText = "TWO";
        break;
      case 3:
        randomNumberText = "THREE";
        break;
      case 4:
        randomNumberText = "FOUR";
        break;
      case 5:
        randomNumberText = "FIVE";
        break;
      case 6:
        randomNumberText = "SIX";
        break;
      case 7:
        randomNumberText = "SEVEN";
        break;
      case 8:
        randomNumberText = "EIGHT";
        break;
      case 9:
        randomNumberText = "NINE";
        break;
    }
  }

  void nextLevel() {
    ColorfulPrint.yellow('MS: ${stopWatch.elapsedMilliseconds}');
    totalMs += stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    _levelDoneSignal(false);
    if (levelCount == 4) {
      ColorfulPrint.yellow('TOTAL MS: $totalMs / ${totalMs / 4}');
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
        tryAgainPressed: () {
          Get.to(FindNumberView());
          registerFindNumberViewModel();
        },
      );

  Future<void> _levelDoneSignal(bool wrongAnswer) async {
    if (wrongAnswer) {
      selectWrongAnswerBackground();
    } else {
      selectCorrectAnswerBackground();
    }
    await Future.delayed(
      const Duration(milliseconds: 50),
      () => resetBackground(),
    );
  }

  void userClicked(int index) {
    if (numberList[index] == randomNumber) {
      nextLevel();
      return;
    }
    wrongSelect();
  }

  void wrongSelect() {
    _levelDoneSignal(true);
    totalMs += 100;
  }

  @observable
  Color backgroundColor = Colors.white;
  @action
  void selectCorrectAnswerBackground() =>
      backgroundColor = MyColors.myLightBlue.withOpacity(.1);
  @action
  selectWrongAnswerBackground() =>
      backgroundColor = MyColors.myRed.withOpacity(.1);
  @action
  void resetBackground() => backgroundColor = Colors.white;

  @action
  void changeRandomNumber() => randomNumber = numberList[getRandomNumber()];

  void generateNumberList() {
    numberList.clear();
    for (int i = 0; i < 9; i++) {
      var rndNumber = getRandomNumber(0, 9 - i);
      numberList.add(numbers[rndNumber]);
      numbers.removeAt(rndNumber);
    }
  }

  void play() {
    resetNumbers();
    generateNumberList();
    changeRandomNumber();
    updateRandomNumberString();
    startCounter();
  }

  void resetNumbers() => numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  void reset() {
    resetNumbers();
    levelCount = 1;
  }

  int getRandomNumber([int from = 0, int to = 9]) =>
      rng.nextInt(to - from) + from;
}
