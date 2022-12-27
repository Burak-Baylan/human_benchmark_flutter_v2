import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/fast_fingers/view/fast_fingers_view.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';
import 'package:mobx/mobx.dart';

import '../../result_page/result_page.dart';
part 'fast_fingers_view_model.g.dart';

class FastFingersViewModel = _FastFingersViewModelBase
    with _$FastFingersViewModel;

abstract class _FastFingersViewModelBase with Store {
  @observable
  int clickCount = 0;

  late Timer _timer;

  @observable
  int counter = 10;

  @action
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          timer.cancel();
          Get.back();
          Get.to(goToResulPage);
        } else {
          counter--;
        }
      },
    );
  }

  void play() {
    clickCount = 0;
    startTimer();
  }

  void userClicked() {
    clickCount++;
  }

  void stopGame() {
    _timer.cancel();
  }

  String resultPageTitle = 'Fast Fingers';
  String get resultPageExp => 'Click Count: $clickCount';
  String resultPageMessage = 'Try Again. You can do better.';

  Widget get goToResulPage => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showBadge: clickCount >= 80,
        showConfetti: clickCount >= 65,
        tryAgainPressed: () {
          Get.to(const FastFingersView());
          registerFastFingersViewModel();
        },
      );
}
