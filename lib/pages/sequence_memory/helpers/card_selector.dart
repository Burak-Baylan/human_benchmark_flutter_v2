import '../../../../utils/injection_helper.dart';
import '../values/const_values.dart';
import '../view_model/sequence_memory_view_model.dart';

class CardSelector {
  static select() => CardSelector()._select();

  SequenceMemoryViewModel sequenceMemoryVm = getit<SequenceMemoryViewModel>();

  Future<void> _select() async {
    sequenceMemoryVm.closeClickable();
    for (var i = 0; i <= sequenceMemoryVm.queue.length - 1; i++) {
      var colorToBeChangeIndex = sequenceMemoryVm.queue[i];
      await _changeCard(colorToBeChangeIndex);
    }
    sequenceMemoryVm.openClickable();
    sequenceMemoryVm.clickable = true;
  }
  
  Future<void> _changeCard(int index) async {
    await Future.delayed(
      AppConstants.cardDisplayDuration,
      () => sequenceMemoryVm.selectWhiteCard(index),
    );
    await Future.delayed(
      AppConstants.cardDisplayDuration,
      () => sequenceMemoryVm.selectTransparentCard(index),
    );
  }
}
