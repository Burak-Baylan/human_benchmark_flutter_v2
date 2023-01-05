import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
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
import '../view/aim_trainer_view.dart';

part 'aim_trainer_view_model.g.dart';

class AimTrainerViewModel = _AimTrainerViewModelBase with _$AimTrainerViewModel;

abstract class _AimTrainerViewModelBase with Store {
  @observable
  var ballWidgetsList = ObservableList<Widget>.of([]);
  @observable
  Color backgroundColor = Colors.white;
  @observable
  bool isPlayButtonVisible = true;
  @observable
  int ballCount = 2;
  @observable
  bool isFirstLevel = true;
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String get worngResultPageExp => 'You failed :(';
  String resultPageMessage = 'Try Again. You can do better.';
  Random rnd = Random();
  bool isUserFailed = false;
  Stopwatch stopWatch = Stopwatch();
  int get getTotalMs => (totalMs + extraMs) ~/ 4;
  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();
  int totalMs = 0;
  int extraMs = 0;
  var shadowBallList = ObservableList<Widget>.of([]);
  List<int> xLocations = [];
  List<int> yLocations = [];
  double get ballSize => 50.w;
  bool isGameStarted = false;
  late BuildContext contextt;
  int get ballMargin => (ballSize + 5.w).toInt();
  int get screenRightCornerMargin => (contextt.width.toInt() - 65.w).toInt();
  int get screenLeftCornerMargin => 15.w.toInt();
  int get screenBottomCornerMargin => (contextt.height.toInt() - 300.h).toInt();

  @action
  void changeIsFirstLevelState(bool state) => isFirstLevel = state;

  void setContext(BuildContext context) => contextt = context;

  void setBallcount(int count) => ballCount = count;

  void incrementBallCount() {
    if (ballCount == 10) return;
    ballCount++;
  }

  void decreaseBallCount() {
    if (ballCount == 2) return;
    ballCount--;
  }

  void play() {
    changeIsFirstLevelState(false);
    isGameStarted = true;
    userStepCount = 0;
    resetBallsLists();
    createBalls();
    closePlayButton();
    startCounter();
  }

  void resetBallsLists() {
    ballWidgetsList.clear();
    shadowBallList.clear();
    xLocations.clear();
    yLocations.clear();
  }

  void closePlayButton() => isPlayButtonVisible = false;
  void openPlayButton() => isPlayButtonVisible = true;

  int userStepCount = 0;

  @observable
  int levelCount = 1;

  void userClickedBall(int index, [bool wrongClick = false]) {
    if (!isGameStarted) return;
    if (wrongClick) {
      extraMs += 1000;
      wrongAnswerSignal();
      return;
    }
    removeBall(index);
    userStepCount++;
    if (userStepCount == ballCount) {
      totalMs += stopWatch.elapsedMilliseconds;
      stopCounter();
      resetCounter();
      correctAnswerSignal();
      nextLevel();
      if (levelCount == 4) {
        goToResult();
        return;
      }
      levelCount++;
      return;
    }
    correctStepSignal();
  }

  void goToResult() {
    addToHistory();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_AIM_TRAINER_HIGH_SCORE,
      score: getTotalMs,
    );
    AdManager.showAimTrainerAd();
    Get.back();
    Get.to(resultPageWidget);
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: '$getTotalMs ms',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_AIM_TRAINER_SCORES, model);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: getTotalMs <= 900,
        showBadge: getTotalMs <= 1100,
        tryAgainPressed: () {
          Get.to(AimTrainerView());
          registerAimTrainerViewModel();
        },
      );

  void nextLevel() {
    isGameStarted = false;
    openPlayButton();
  }

  Future<void> wrongAnswerSignal() async {
    backgroundColor = Colors.redAccent.withOpacity(.4);
    await Future.delayed(const Duration(milliseconds: 50));
    backgroundColor = Colors.white;
  }

  Future<void> correctAnswerSignal() async {
    backgroundColor = Colors.greenAccent.withOpacity(.2);
    await Future.delayed(const Duration(milliseconds: 100));
    backgroundColor = Colors.white;
  }

  Future<void> correctStepSignal() async {
    backgroundColor = Colors.blueAccent.withOpacity(.2);
    await Future.delayed(const Duration(milliseconds: 50));
    backgroundColor = Colors.white;
  }

  void createBalls() {
    for (var i = 0; i < ballCount; i++) {
      var ballW = createBall(i);
      shadowBallList.add(ballW);
    }
    ballWidgetsList = shadowBallList;
  }

  Positioned createBall(int index) {
    var x = getRandomNumber(screenLeftCornerMargin, screenRightCornerMargin);
    var y = getRandomNumber(0, screenBottomCornerMargin);
    if (!checkLocations(x, y)) {
      return createBall(index);
    }
    xLocations.add(x);
    yLocations.add(y);
    return ballWidget(x.toDouble(), y.toDouble(), index);
  }

  bool checkLocations(int x, int y) {
    List<bool> boolList = [];
    for (var i = 0; i < shadowBallList.length; i++) {
      var otherBallX = xLocations[i];
      var otherBallY = yLocations[i];
      if (checkXPosition(x, otherBallX) && checkYPosition(y, otherBallY)) {
        boolList.add(false);
        continue;
      }
      boolList.add(true);
    }
    if (boolList.contains(false)) return false;
    return true;
  }

  bool checkXPosition(int x1, int x2) =>
      x1 > (x2 - ballMargin) && x1 < (x2 + ballMargin);

  bool checkYPosition(int y1, int y2) =>
      y1 > (y2 - ballMargin) && y1 < (y2 + ballMargin);

  void removeBall(int index) => ballWidgetsList[index] = Container();

  Positioned ballWidget(double x, double y, int index) {
    return Positioned(
      top: y,
      left: x,
      child: GestureDetector(
        onTap: () => userClickedBall(index),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(1500)),
          child: Container(
            width: ballSize,
            height: ballSize,
            color: MyColors.secondaryColor,
            child: Icon(
              Icons.adjust_rounded,
              size: 40.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  int getRandomNumber([int from = 1, int to = 10]) =>
      rnd.nextInt(to - from) + from;
}
