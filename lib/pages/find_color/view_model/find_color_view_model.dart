import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/values/const_values.dart';
import 'package:mobx/mobx.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../../utils/injection_helper.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
import '../view/find_color_view.dart';

part 'find_color_view_model.g.dart';

class FindColorViewModel = _FindColorViewModelBase with _$FindColorViewModel;

abstract class _FindColorViewModelBase with Store {
  var rnd = Random();
  bool lock = false;
  List<Color> colors = [];
  int totalMs = 0;
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';
  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => totalMs ~/ 4;

  @observable
  var colorList = ObservableList<Color>.of([]);
  @observable
  Color randomColor = Colors.red;
  @observable
  String randomColorText = '';
  @observable
  int levelCount = 1;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  @action
  void updateRandomNumberString() {
    if (Colors.yellow == randomColor) {
      randomColorText = 'YELLOW';
    } else if (Colors.orange == randomColor) {
      randomColorText = 'ORANGE';
    } else if (Colors.blue == randomColor) {
      randomColorText = "BLUE";
    } else if (Colors.red == randomColor) {
      randomColorText = "RED";
    } else if (Colors.black == randomColor) {
      randomColorText = "BLACK";
    } else if (Colors.brown == randomColor) {
      randomColorText = "BROWN";
    } else if (Colors.grey == randomColor) {
      randomColorText = "GREY";
    } else if (Colors.green == randomColor) {
      randomColorText = "GREEN";
    } else if (Colors.purple == randomColor) {
      randomColorText = "PURPLE";
    }
  }

  void nextLevel() {
    totalMs += stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    _levelDoneSignal(false);
    if (levelCount == 4) {
      goToResult();
      return;
    }
    play();
    levelCount++;
  }

  void goToResult() {
    addToHistory();
    AdManager.showFindColorAd();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_FIND_COLOR_HIGH_SCORE,
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
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_FIND_COLOR_SCORES, model);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showBadge: getTotalMs <= 630,
        showConfetti: getTotalMs <= 690,
        gameIndex: AppConstants.findColorGameIndex,
        tryAgainPressed: () {
          Get.to(FindColorView());
          registerFindColorViewModel();
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
    if (colorList[index] == randomColor) {
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
      backgroundColor = MyColors.myGreen.withOpacity(.1);
  @action
  selectWrongAnswerBackground() =>
      backgroundColor = MyColors.myRed.withOpacity(.1);
  @action
  void resetBackground() => backgroundColor = Colors.white;

  @action
  void changeRandomNumber() => randomColor = colorList[getRandomNumber()];

  void generateColorList() {
    colorList.clear();
    for (int i = 0; i < 9; i++) {
      print('Index: $i');
      var rndNumber = getRandomNumber(0, 9 - i);
      colorList.add(colors[rndNumber]);
      colors.removeAt(rndNumber);
    }
  }

  void play() {
    resetColors();
    generateColorList();
    changeRandomNumber();
    updateRandomNumberString();
    startCounter();
  }

  void resetColors() => colors = [
        Colors.yellow,
        Colors.orange,
        Colors.blue,
        Colors.red,
        Colors.black,
        Colors.brown,
        Colors.grey,
        Colors.green,
        Colors.purple,
      ];

  void reset() {
    resetColors();
    levelCount = 1;
  }

  int getRandomNumber([int from = 0, int to = 9]) =>
      rnd.nextInt(to - from) + from;
}
