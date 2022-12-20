import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/colors.dart';
import '../../result_page/result_page.dart';
import '../view/falling_balls_view.dart';

part 'falling_balls_view_model.g.dart';

class FallingBallsViewModel = _FallingBallsViewModelBase
    with _$FallingBallsViewModel;

abstract class _FallingBallsViewModelBase with Store {
  String resultPageTitle = 'Average Time';
  String get resultPageExp => '$getTotalMs milliseconds';
  String resultPageMessage = 'Try Again. You can do better.';

  @observable
  double positionY = 0;

  late Timer globalTimer;

  Random rnd = Random();

  Stopwatch stopWatch = Stopwatch();

  int get getTotalMs => totalMs ~/ destroyedBallCount;

  void startCounter() => stopWatch.start();
  void stopCounter() => stopWatch.stop();
  void resetCounter() => stopWatch.reset();

  int totalMs = 0;
  int extraMs = 0;

  @observable
  int gameDuration = 15;

  int destroyedBallCount = 0;

  @observable
  var positions = ObservableList<double>.of([]);

  @observable
  var balls = ObservableList<Widget>.of([]);

  late BuildContext contextt;

  void setContext(BuildContext context) => contextt = context;

  void play() {
    createBall();
    const time = Duration(seconds: 1);
    globalTimer = Timer.periodic(
      time,
      (Timer timer) {
        if (gameDuration == 0) {
          sendToResultPage();
          globalTimer.cancel();
          return;
        }
        gameDuration--;
      },
    );
  }

  void sendToResultPage() {
    Get.back();
    Get.to(goToResulPage);
  }

  void createBall() {
    int x = getRandomNumber(20, (contextt.width.toInt() - 100.w).toInt());
    positions.add(0);
    Widget ball = Observer(builder: (context) {
      return ballWidget(
          x.toDouble(), positions[positions.length - 1], balls.length - 1);
    });
    balls.add(ball);
    moveBall(positions.length - 1);
    startCounter();
  }

  void stopTimers() {
    for (var i = 0; i < timers.length; i++) {
      timers[i].cancel();
    }
    globalTimer.cancel();
    stopCounter();
  }

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        tryAgainPressed: () {
          Get.to(FallingBallsView());
          registerFallingBallsViewModel();
        },
      );

  List<Timer> timers = [];

  @action
  void moveBall(int index) {
    late Timer timer;
    const time = Duration(milliseconds: 3);
    timer = Timer.periodic(
      time,
      (Timer timer) {
        double position = positions[index];
        print('moving $index | position: $position');
        positions[index] = ++position;
        if (position > contextt.height) {
          deleteBall(index, 3000);
        }
      },
    );
    timers.add(timer);
  }

  void deleteBall(int index, [int? extraMs]) {
    destroyedBallCount++;
    totalMs += extraMs ?? stopWatch.elapsedMilliseconds;
    stopCounter();
    resetCounter();
    timers[index].cancel();
    balls[index] = Container();
    createBall();
  }

  Widget ballWidget(double x, double y, int index) {
    return Positioned(
      top: y,
      left: x,
      child: GestureDetector(
        onTap: () {
          deleteBall(index);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1500)),
          child: Container(
            width: 50.w,
            height: 50.h,
            color: MyColors.secondaryColor,
          ),
        ),
      ),
    );
  }

  int getRandomNumber([int from = 1, int to = 10]) =>
      rnd.nextInt(to - from) + from;
}
