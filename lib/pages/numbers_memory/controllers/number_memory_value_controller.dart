import 'dart:math';
import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import '../../../core/hive/hive_constants.dart';
import '../../../helpers/high_score_comparator.dart';
import 'numbers_memory_controller.dart';

class NumbersMemoryValueController extends NumbersMemoryController {
  var levelCounter = 1;
  String number = "";

  String usersAnswer = "";

  int get levelSecond => levelCounter * 1000;

  incrementLevel() => levelCounter++;

  String numberGenerator() {
    number = "";
    var random = Random();
    for (var i = 1; i <= levelCounter; i++) {
      number += random.nextInt(10).toString();
    }
    return number;
  }

  checkAnswer(NumbersMemoryController c) {
    if (usersAnswer.length >= 1) {
      var c = Get.find<NumbersMemoryController>();
      if (usersAnswer == number) {
        c.selectCorrectAnswerPage();
      } else {
        AdManager.showNumbersMemoryeAd();
        HightScoreComparator.compare(
          boxName: HiveConstants.BOX_NUMBERS_MEMORY_HIGH_SCORE,
          score: levelCounter,
          compareAsLower: false,
        );
        c.selectWrongAnswerPage();
      }
    }
  }

  reset() {
    number = "";
    usersAnswer = "";
    levelCounter = 1;
  }
}
