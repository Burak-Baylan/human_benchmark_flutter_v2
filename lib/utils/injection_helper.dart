import 'package:get_it/get_it.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/view_model/sequence_memory_view_model.dart';

var getit = GetIt.instance;

Future<void> setUpInjections() async {
  registerSequenceMemoryViewmodel();
}

void registerSequenceMemoryViewmodel() {
  if (getit.isRegistered(instance: SequenceMemoryViewModel())) return;
  try {
    getit.registerLazySingleton<SequenceMemoryViewModel>(
        () => SequenceMemoryViewModel());
  } catch (e) {}
}

void unregisterSequenceMemoryViewmodel() =>
    getit.unregister(instance: getit<SequenceMemoryViewModel>());
