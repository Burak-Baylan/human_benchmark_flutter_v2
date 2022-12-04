import 'package:get_it/get_it.dart';
import 'package:human_benchmark_flutter_v2/pages/find_number/view_model/find_number_view_model.dart';
import 'package:human_benchmark_flutter_v2/pages/sequence_memory/view_model/sequence_memory_view_model.dart';

var getit = GetIt.instance;

Future<void> setUpInjections() async {
  registerSequenceMemoryViewmodel();
  registerFindNumberViewModel();
}

void registerFindNumberViewModel() {
  if (getit.isRegistered(instance: FindNumberViewModel())) return;
  try {
    getit.registerLazySingleton<FindNumberViewModel>(
        () => FindNumberViewModel());
  } catch (e) {}
}

void registerSequenceMemoryViewmodel() {
  if (getit.isRegistered(instance: SequenceMemoryViewModel())) return;
  try {
    getit.registerLazySingleton<SequenceMemoryViewModel>(
        () => SequenceMemoryViewModel());
  } catch (e) {}
}

void unregisterFindNumberViewmodel() =>
    getit.unregister(instance: getit<FindNumberViewModel>());

void unregisterSequenceMemoryViewmodel() =>
    getit.unregister(instance: getit<SequenceMemoryViewModel>());
