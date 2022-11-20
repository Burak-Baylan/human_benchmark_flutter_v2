import 'package:human_benchmark_flutter_v2/pages/sequence_memory/view_model/sequence_memory_view_model.dart';
import 'package:human_benchmark_flutter_v2/utils/injection_helper.dart';

import '../../../../helpers/random_number_generator.dart';

class Sequencer {

  static sequence() => Sequencer()._chooseCard();

  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();

  _chooseCard() {
    var rndNumber = RandomNumber.minMax(0, 9).randomNumber;
    if (!_isNumberCopy(rndNumber)) {
      sequenceMemoryVm.queue.add(rndNumber);
    }else{
      _chooseCard();
    }
  }

  static int? previousNumber;

  bool _isNumberCopy(int number) {
    if (previousNumber != null) {
      if (previousNumber == number) {
        return true;
      }
    }
    previousNumber = number;
    return false;
  }
}
