import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/colors.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../result_page/result_page.dart';
import '../view/blind_numbers_view.dart';

part 'blind_numbers_view_model.g.dart';

class BlindNumbersViewModel = _BlindNumbersViewModelBase
    with _$BlindNumbersViewModel;

abstract class _BlindNumbersViewModelBase with Store {
  @observable
  int levelCount = 1;
  @observable
  int ballCount = 1;
  @observable
  var closedBalls = ObservableList<int>.of([]);
  @observable
  bool closeBalls = false;
  @observable
  Color backgroundColor = Colors.white;
  @observable
  var ballWidgetsList = ObservableList<Widget>.of([]);
  var shadowBallList = ObservableList<Widget>.of([]);
  List<int> xLocations = [];
  List<int> yLocations = [];
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';
  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();
  Stopwatch stopWatch = Stopwatch();
  int get getTotalMs => (totalMs + extraMs) ~/ 4;
  int totalMs = 0;
  int extraMs = 0;
  Random rnd = Random();
  late BuildContext contextt;
  double get ballSize => 50.w;
  int get ballMargin => (ballSize + 10.w).toInt();
  int get screenRightCornerMargin => (contextt.width.toInt() - 65.w).toInt();
  int get screenLeftCornerMargin => 15.w.toInt();
  int get screenBottomCornerMargin => (contextt.height.toInt() - 300.h).toInt();

  Widget createBall(int index) {
    var x = getRandomNumber(screenLeftCornerMargin, screenRightCornerMargin);
    var y = getRandomNumber(0, screenBottomCornerMargin);
    if (!checkLocations(x, y)) {
      return createBall(index);
    }
    xLocations.add(x);
    yLocations.add(y);
    return ballWidget(x.toDouble(), y.toDouble(), index);
  }

  void setContext(BuildContext context) => contextt = context;

  int nextIndex = 1;

  void userClickedBall(int index) {
    if (index != nextIndex) {
      wrongAnswerSignal();
      extraMs += 1000;
      return;
    }
    correctStepSignal();
    closeBalls = true;
    closedBalls.add(index);
    nextIndex++;
    if (index == ballCount) {
      totalMs += stopWatch.elapsedMilliseconds;
      stopCounter();
      resetCounter();
      correctAnswerSignal();
      if (levelCount == 5) {
        Get.back();
        Get.to(goToResulPage);
        return;
      }
      levelCount++;
      ballCount++;
      play();
    }
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        tryAgainPressed: () {
          Get.to(const BlindNumbersView());
          registerBlindInARowViewModel();
        },
      );

  void play() {
    reset();
    createBalls();
    startCounter();
  }

  void reset() {
    ballWidgetsList.clear();
    shadowBallList.clear();
    xLocations.clear();
    yLocations.clear();
    closedBalls.clear();
    closeBalls = false;
    nextIndex = 1;
  }

  void createBalls() {
    for (var i = 1; i <= ballCount; i++) {
      var ballW = createBall(i);
      shadowBallList.add(ballW);
      if (!closeBalls) continue;
      closedBalls.add(i);
    }
    ballWidgetsList = shadowBallList;
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

  Widget ballWidget(double x, double y, int index) {
    return Observer(builder: (_) {
      return closedBalls.contains(index)
          ? Container()
          : Positioned(
              top: y,
              left: x,
              child: GestureDetector(
                onTap: () => userClickedBall(index),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    children: [
                      Container(
                        width: ballSize,
                        height: ballSize,
                        color: MyColors.secondaryColor,
                        child: Center(
                          child: LessText.lessFuturedText(
                            text: index.toString(),
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      Observer(builder: (_) {
                        return Container(
                          width: ballSize,
                          height: ballSize,
                          color: closeBalls
                              ? MyColors.secondaryColor
                              : Colors.transparent,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  int getRandomNumber([int from = 1, int to = 10]) =>
      rnd.nextInt(to - from) + from;
}
