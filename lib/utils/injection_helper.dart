import 'package:get_it/get_it.dart';
import '../pages/catch_color/view_model/catch_color_view_model.dart';
import '../pages/colored_text/view_model/colored_text_view_model.dart';
import '../pages/count_one_by_one/view_model/count_by_one_by_view_model.dart';
import '../pages/fast_fingers/view_model/fast_fingers_view_model.dart';
import '../pages/find_color/view_model/find_color_view_model.dart';
import '../pages/find_number/view_model/find_number_view_model.dart';
import '../pages/math/view_model/math_view_model.dart';
import '../pages/sequence_memory/view_model/sequence_memory_view_model.dart';
import '../pages/vibration/view_model/vibration_view_model.dart';

var getit = GetIt.instance;

Future<void> setUpInjections() async {
  registerSequenceMemoryViewmodel();
  registerFindNumberViewModel();
  registerFindColorViewModel();
  registerCatchColorViewModel();
  registerVibrationViewModel();
  registerMathViewModel();
  registerCountOneByOneViewModel();
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

void registerFindColorViewModel() {
  if (getit.isRegistered(instance: FindColorViewModel())) return;
  try {
    getit.registerLazySingleton<FindColorViewModel>(() => FindColorViewModel());
  } catch (e) {}
}

void registerCatchColorViewModel() {
  if (getit.isRegistered(instance: CatchColorViewModel())) return;
  try {
    getit.registerLazySingleton<CatchColorViewModel>(
        () => CatchColorViewModel());
  } catch (e) {}
}

void registerFastFingersViewModel() {
  if (getit.isRegistered(instance: FastFingersViewModel())) return;
  try {
    getit.registerLazySingleton<FastFingersViewModel>(
        () => FastFingersViewModel());
  } catch (e) {}
}

void registerColoredTextViewModel() {
  if (getit.isRegistered(instance: ColoredTextViewModel())) return;
  try {
    getit.registerLazySingleton<ColoredTextViewModel>(
        () => ColoredTextViewModel());
  } catch (e) {}
}

void registerVibrationViewModel() {
  if (getit.isRegistered(instance: VibrationViewModel())) return;
  try {
    getit.registerLazySingleton<VibrationViewModel>(() => VibrationViewModel());
  } catch (e) {}
}

void registerMathViewModel() {
  if (getit.isRegistered(instance: MathViewModel())) return;
  try {
    getit.registerLazySingleton<MathViewModel>(() => MathViewModel());
  } catch (e) {}
}

void registerCountOneByOneViewModel() {
  if (getit.isRegistered(instance: CountOneByOneViewModel())) return;
  try {
    getit.registerLazySingleton<CountOneByOneViewModel>(() => CountOneByOneViewModel());
  } catch (e) {}
}

void unregisterCountOneByOneViewModel() =>
    getit.unregister(instance: getit<CountOneByOneViewModel>());

void unregisterMathViewModel() =>
    getit.unregister(instance: getit<MathViewModel>());

void unregisterColoredTextViewModel() =>
    getit.unregister(instance: getit<ColoredTextViewModel>());

void unregisterVibrationViewModel() =>
    getit.unregister(instance: getit<VibrationViewModel>());

void unregisterFastFingersViewmodel() =>
    getit.unregister(instance: getit<FastFingersViewModel>());

void unregisterCatchColorViewmodel() =>
    getit.unregister(instance: getit<CatchColorViewModel>());

void unregisterFindNumberViewmodel() =>
    getit.unregister(instance: getit<FindNumberViewModel>());

void unregisterSequenceMemoryViewmodel() =>
    getit.unregister(instance: getit<SequenceMemoryViewModel>());

void unregisterFindColorViewModel() =>
    getit.unregister(instance: getit<FindColorViewModel>());
