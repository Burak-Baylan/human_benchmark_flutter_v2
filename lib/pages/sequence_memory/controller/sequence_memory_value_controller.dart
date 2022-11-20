import 'package:get/get.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/controller/sequence_memory_controller.dart';

import 'helpers/card_selector.dart';
import 'helpers/sequencer.dart';

class SequenceMemoryValueController extends GetxController {

  SequenceMemoryValueController(){
    c = Get.find();
  }

  int _levelCounter = 1;
  int get levelCount => _levelCounter;
  int _userClickCounter = 0;

  List<int> queue = [];
  List<int> userClickRow = [];

  late SequenceMemoryController c;

  void incrementLevel() => _levelCounter++;

  void reset() {
    userClickRow.clear();
    _userClickCounter = 0;
  }

  void hardReset() {
    queue.clear();
    _levelCounter = 1;
    reset();
  }

  void play() {
    Sequencer.sequence();
    CardSelector.select();
  }

  void userStepCheck(int index) {
    if (queue[_userClickCounter] == index) {
      _correctStep();
    } else {
      _wrongAnswer();
    }
  }

  void _correctStep() async {
    _userClickCounter++;
    if (_userClickCounter == levelCount) {
      _levelDoneSignal();
      reset();
      incrementLevel();
      play();
    }
  }

  Future<void> _levelDoneSignal() async {
    await Future.delayed(Duration(milliseconds: 200), () => c.selectCorrectAnswerBackground());
    await Future.delayed(Duration(milliseconds: 200), () => c.resetBackground());
  }

  void _wrongAnswer() {
    reset();
    c.selectWrongAnswerPage();
  }
}
