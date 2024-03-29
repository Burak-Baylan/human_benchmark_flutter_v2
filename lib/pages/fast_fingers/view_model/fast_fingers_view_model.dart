import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/values/const_values.dart';
import 'package:mobx/mobx.dart';
import '../../../ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../core/hive/hive_manager.dart';
import '../../../helpers/date_helper.dart';
import '../../../helpers/high_score_comparator.dart';
import '../../../utils/injection_helper.dart';
import '../../history_page/view/history_view.dart';
import '../../result_page/result_page.dart';
import '../view/fast_fingers_view.dart';

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
          goToResult();
        } else {
          counter--;
        }
      },
    );
  }

  void goToResult() {
    addToHistory();
    AdManager.showFastFingersAd();
    HightScoreComparator.compare(
      boxName: HiveConstants.BOX_FAST_FINGERS_HIGH_SCORE,
      score: clickCount,
      compareAsLower: false,
    );
    Get.back();
    Get.to(resultPageWidget);
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

  void addToHistory() {
    var model = HistoryModel(
      date: DateHelper.getDateStr,
      text: 'Clicked $clickCount times',
    );
    HiveManager.putData<HistoryModel>(
        HiveConstants.BOX_FAST_FINGERS_SCORES, model);
  }

  Widget get resultPageWidget => ResultPage(
        title: resultPageTitle,
        exp: resultPageExp,
        message: resultPageMessage,
        showBadge: clickCount >= 50,
        showConfetti: clickCount >= 45,
        gameIndex: AppConstants.fastFingersGameIndex,
        tryAgainPressed: () {
          Get.to(const FastFingersView());
          registerFastFingersViewModel();
        },
      );
}
