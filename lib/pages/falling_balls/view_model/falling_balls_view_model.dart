import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/values/const_values.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
import '../view/falling_balls_view.dart';

part 'falling_balls_view_model.g.dart';

class FallingBallsViewModel = _FallingBallsViewModelBase
    with _$FallingBallsViewModel;

abstract class _FallingBallsViewModelBase with Store {
  @observable
  double positionY = 0;
  @observable
  int gameDuration = 15;
  @observable
  ObservableList<double> positions = ObservableList<double>();
  @observable
  var ballss = ObservableList<Widget>.of([]);
  @observable
  Widget ballWidgetW = Container();
  @observable
  Color backgroundColor = Colors.white;
  String resultPageTitle = 'Destroyed Balls | Average Time';
  String get resultPageExp =>
      'Destroyed Balls: $destroyedBallCount\n Average ms: $getTotalMs';
  String resultPageMessage = 'Try Again. You can do better.';
  int totalMs = 0;
  int extraMs = 0;
  int destroyedBallCount = 0;
  late BuildContext contextt;
  late Timer globalTimer;
  Random rnd = Random();
  Stopwatch stopWatch = Stopwatch();
  late Timer ballTimer;

  int get getTotalMs => (totalMs + extraMs) ~/ destroyedBallCount;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  void setContext(BuildContext context) => contextt = context;

  Future<void> wrongAnswerSignal() async {
    await changeBackgroundColor(Colors.redAccent.withOpacity(.2));
  }

  Future<void> correctAnswerSignal() async {
    await changeBackgroundColor(Colors.greenAccent.withOpacity(.2));
  }

  Future<void> changeBackgroundColor(Color color) async {
    backgroundColor = color;
    await Future.delayed(const Duration(milliseconds: 50));
    backgroundColor = Colors.white;
  }

  void wrongAnswer() {
    wrongAnswerSignal();
    extraMs += 1000;
  }

  @action
  void play() {
    createBall();
    startGlobalTimer();
  }

  void startGlobalTimer() {
    const time = Duration(seconds: 1);
    globalTimer = Timer.periodic(
      time,
      (Timer timer) {
        if (gameDuration == 0) {
          goToResult();
          globalTimer.cancel();
          return;
        }
        gameDuration--;
      },
    );
  }

  @action
  void createBall() {
    int x = getRandomNumber(20, (contextt.width.toInt() - 100.w).toInt());
    positions.add(0);
    ballWidgetW = getBallWidget(x.toDouble(), positions.length - 1);
    moveBall(positions.length - 1);
    startCounter();
  }

  Widget getBallWidget(double x, int index) {
    return Observer(
      builder: (context) => ballWidget(x.toDouble(), positions[index], index),
    );
  }

  void stopTimers() {
    ballTimer.cancel();
    globalTimer.cancel();
    stopCounter();
  }

  void goToResult() {
    addToHistory();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_FALLING_BALLS_HIGH_SCORE,
      score: getTotalMs,
    );
    AdManager.showFallingBallsAd();
    Get.back();
    Get.to(resultPageWidget);
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: 'Destroyed Balls: $destroyedBallCount\nAverage ms: $getTotalMs',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_FALLING_BALLS_SCORES, model);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: getTotalMs <= 1000,
        showBadge: getTotalMs <= 850,
        gameIndex: AppConstants.fallingBallsGameIndex,
        tryAgainPressed: () {
          Get.to(FallingBallsView());
          registerFallingBallsViewModel();
        },
      );

  @action
  void moveBall(int index) {
    const time = Duration(milliseconds: 3);
    ballTimer = Timer.periodic(
      time,
      (Timer timer) {
        double position = positions[index];
        positions[index] = ++position;
        if (position > contextt.height) {
          deleteBall(index, 3000);
        }
      },
    );
  }

  void deleteBall(int index, [int? extraMs]) {
    destroyedBallCount++;
    totalMs += extraMs ?? stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    ballTimer.cancel();
    createBall();
  }

  Widget ballWidget(double x, double y, int index) {
    return Positioned(
      top: y,
      left: x,
      child: GestureDetector(
        onTap: () {
          correctAnswerSignal();
          deleteBall(index);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1500)),
          child: Container(
            width: 50.w,
            height: 50.w,
            color: MyColors.secondaryColor,
          ),
        ),
      ),
    );
  }

  int getRandomNumber([int from = 1, int to = 10]) =>
      rnd.nextInt(to - from) + from;
}
