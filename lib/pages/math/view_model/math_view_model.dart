import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:human_benchmark_flutter_v2/helpers/colorful_print.dart';
import 'package:human_benchmark_flutter_v2/pages/math/view/math_view.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
part 'math_view_model.g.dart';

class MathViewModel = _MathViewModelBase with _$MathViewModel;

abstract class _MathViewModelBase with Store {
  Random rnd = Random();

  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String get worngResultPageExp => 'You failed :(';
  String resultPageMessage = 'Try Again. You can do better.';

  bool isUserFailed = false;

  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => totalMs ~/ 4;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  int operationAsInt = 0;
  int unknownDigit = 0;
  String unknownDigitAsString = '';

  int totalMs = 0;

  int num1 = 0;
  int num2 = 0;
  int result = 0;

  String questionResult = '';

  @observable
  int levelCount = 1;

  @observable
  var results = ObservableList<String>.of(['0', '0', '0', '0']);

  List<String> operationList = ['+', '-', '*', '/'];

  @observable
  String problemString = '';

  void prepareProblemWidget(List<String> texts) {
    problemWidget;
    for (int i = 0; i <= 3; i++) {
      problemWidgetList.add(LessText.lessFuturedText(
        text: texts[i],
        color: MyColors.secondaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 35.sp,
      ));
      //problemString += '${texts[i]} ';
      if (i == 2) problemString += '= ';
    }
  }

  void createResulString() {
    var num1Str = num1.toString();
    var operationAsStr = getOperationStr();
    var num2Str = num2.toString();
    var resultStr = result.toString();
    List<String> texts = [num1Str, operationAsStr, num2Str, resultStr];
    questionResult = texts[unknownDigit];
    unknownDigitAsString = texts[unknownDigit];
    texts[unknownDigit] = '?';
    for (int i = 0; i <= 3; i++) {
      problemString += '${texts[i]} ';
      if (i == 2) problemString += '= ';
    }
  }

  List<Widget> problemWidgetList = [];

  Row problemWidget = Row();

  void play() {
    resetGame();
    createOperation();
    createProblem();
    findUnknownDigit();
    createResulString();
    if (unknownDigit == 1) {
      createResultsListAsOperation();
    } else {
      createResultsList();
    }
    startCounter();
  }

  void resetGame() {
    problemString = '';
  }

  @action
  void createResultsList() {
    int rndNumber = getRandomNumber(0, 4);
    List<int> numList = [];
    for (var i = 3; i >= 0; i--) {
      var rndNum = getRanomNumberForResult(numList);
      numList.add(rndNum);
      results[i] = rndNum.toString();
    }
    results[rndNumber] = unknownDigitAsString;
    numList.clear();
  }

  int getRanomNumberForResult(List<int> numList) {
    var rndNum = getRandomNumber(
      int.parse(unknownDigitAsString) - getRandomNumber(4, 9),
      int.parse(unknownDigitAsString) + getRandomNumber(4, 9),
    );
    if (numList.contains(rndNum) || rndNum.toString() == unknownDigitAsString) {
      return getRanomNumberForResult(numList);
    }
    return rndNum;
  }

  @action
  void createResultsListAsOperation() {
    for (var i = 3; i >= 0; i--) {
      results[i] = operationList[i];
    }
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: isUserFailed ? worngResultPageExp : resultPageExp,
        message: resultPageMessage,
        showConfetti: isUserFailed ? false : getTotalMs <= 1300,
        showBadge: isUserFailed ? false : getTotalMs <= 1000,
        tryAgainPressed: () {
          Get.to(MathView());
          registerMathViewModel();
        },
      );

  void userClicked(String text) {
    if (text != questionResult) {
      isUserFailed = true;
      sendToResulPage();
      return;
    }
    if (levelCount == 4) {
      sendToResulPage();
      return;
    }
    levelCount++;
    totalMs += stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    play();
  }

  void sendToResulPage() {
    addToHistory();
    AdManager.showMathAd();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_MATH_HIGH_SCORE,
      score: getTotalMs,
    );
    Get.back();
    Get.to(resultPageWidget);
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: '$getTotalMs ms',
    );
    HiveManager.putData<HistoryModel>(HiveConstants.BOX_MATH_SCORES, model);
  }

  void findUnknownDigit() => unknownDigit = getRandomNumber(0, 4);

  void createProblem() {
    num1 = getRandomNumber();
    num2 = getRandomNumber();
    if (operationAsInt == 4) num1 = num2;
    result = 0;
    switch (operationAsInt) {
      case 1:
        result = num1 + num2;
        break;
      case 2:
        result = num1 - num2;
        break;
      case 3:
        result = num1 * num2;
        break;
      case 4:
        result = num1 ~/ num2;
        break;
    }
  }

  String getOperationStr() {
    switch (operationAsInt) {
      case 1:
        return '+';
      case 2:
        return '-';
      case 3:
        return '*';
      case 4:
        return '/';
      default:
        return '*';
    }
  }

  void createOperation() => operationAsInt = getRandomNumber(1, 5);

  int getRandomNumber([int from = 1, int to = 10]) =>
      rnd.nextInt(to - from) + from;
}
