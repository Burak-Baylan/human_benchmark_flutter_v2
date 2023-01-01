import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/ask_number_page.dart';
import '../pages/hint_page.dart';
import '../pages/results_pages/correct_answer_page.dart';
import '../pages/results_pages/numbers_memory_wrong_answer_page.dart';
import '../pages/show_number_page.dart';
import 'number_memory_value_controller.dart';

class NumbersMemoryController extends GetxController {
  NumbersMemoryValueController get valueController =>
      Get.find<NumbersMemoryValueController>();

  var page = 0.obs;

  bool protectedFocusLost = false;
  bool onShowNumberPage = false;

  List<Widget> pages = [
    NumbersMemoryMenu(),
    ShowNumber(),
    AskNumber(),
    CorrectAnswer(),
    NumbersMemoryWrongAnswer(),
  ];

  void selectHintPage() => page.value = 0;

  void selectShowNumberPage() => page.value = 1;

  void selectAskNumberPage() => page.value = 2;

  void selectCorrectAnswerPage() => page.value = 3;

  void selectWrongAnswerPage() => page.value = 4;

  reset() {
    page.value = 0;
    valueController.reset();
    protectedFocusLost = false;
    onShowNumberPage = false;
  }
}
