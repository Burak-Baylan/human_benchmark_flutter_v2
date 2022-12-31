import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:mobx/mobx.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/date_helper.dart';
import '../../../utils/injection_helper.dart';
import '../../../widgets/text/less_futured_text.dart';
import '../../history_page/view/history_view.dart';
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
  String resultPageTitle = 'Level';
  String get resultPageExp => 'Level $levelCount';
  String resultPageMessage = 'Try Again. You can do better.';
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
      Get.back();
      Get.to(resultPageWidget);
      ;
      return;
    }
    correctStepSignal();
    closeBalls = true;
    closedBalls.add(index);
    nextIndex++;
    if (index == ballCount) {
      correctAnswerSignal();
      if (levelCount == 10) {
        goToResult();
        return;
      }
      levelCount++;
      ballCount++;
      play();
    }
  }

  void goToResult() {
    addToHistory();
    AdManager.showBlindNumbersAd();
    Get.back();
    Get.to(resultPageWidget);
  }

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: 'Level: $levelCount',
    );
    HiveManager.putData(HiveConstants.BOX_VIBRATION_SCORES, model);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showConfetti: levelCount >= 7,
        showBadge: levelCount >= 11,
        tryAgainPressed: () {
          Get.to(const BlindNumbersView());
          registerBlindInARowViewModel();
        },
      );

  void play() {
    reset();
    createBalls();
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
