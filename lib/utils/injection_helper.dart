import 'package:get_it/get_it.dart';
import 'package:human_benchmark_flutter_v2/pages/paywall/view_model/paywall_view_model.dart';
import '../pages/aim_trainer/view_model/aim_trainer_view_model.dart';
import '../pages/blind_numbers/view_model/blind_numbers_view_model.dart';
import '../pages/catch_color/view_model/catch_color_view_model.dart';
import '../pages/color_cell_count/view_model/color_cell_count_view_model.dart';
import '../pages/colored_text/view_model/colored_text_view_model.dart';
import '../pages/count_one_by_one/view_model/count_by_one_by_view_model.dart';
import '../pages/falling_balls/view_model/falling_balls_view_model.dart';
import '../pages/fast_fingers/view_model/fast_fingers_view_model.dart';
import '../pages/find_color/view_model/find_color_view_model.dart';
import '../pages/find_number/view_model/find_number_view_model.dart';
import '../pages/history_page/view_model/history_view_model.dart';
import '../pages/hold_and_click/view_model/hold_and_click_view_model.dart';
import '../pages/math/view_model/math_view_model.dart';
import '../pages/result_page/view_model/result_page_view_model.dart';
import '../pages/sequence_memory/view_model/sequence_memory_view_model.dart';
import '../pages/vibration/view_model/vibration_view_model.dart';
import '../pages/visual_memory/view_model/visual_memory_view_model.dart';

var getit = GetIt.instance;

Future<void> setUpInjections() async {
  registerSequenceMemoryViewmodel();
  registerFindNumberViewModel();
  registerFindColorViewModel();
  registerCatchColorViewModel();
  registerVibrationViewModel();
  registerMathViewModel();
  registerCountOneByOneViewModel();
  registerColorCellCountViewModel();
  registerFallingBallsViewModel();
  registerHoldAndClickViewModel();
  registerVisualMemoryViewModel();
  registerBlindInARowViewModel();
  registerResultPageViewModel();
  registerHistoryPageViewModel();
  registerPaywallPageViewModel();
}

void registerPaywallPageViewModel() {
  if (getit.isRegistered(instance: PaywallViewModel())) return;
  try {
    getit.registerLazySingleton<PaywallViewModel>(() => PaywallViewModel());
  } catch (e) {}
}

void registerHistoryPageViewModel() {
  if (getit.isRegistered(instance: HistoryViewModel())) return;
  try {
    getit.registerLazySingleton<HistoryViewModel>(() => HistoryViewModel());
  } catch (e) {}
}

void registerResultPageViewModel() {
  if (getit.isRegistered(instance: ResultPageViewModel())) return;
  try {
    getit.registerLazySingleton<ResultPageViewModel>(
        () => ResultPageViewModel());
  } catch (e) {}
}

void registerBlindInARowViewModel() {
  if (getit.isRegistered(instance: BlindNumbersViewModel())) return;
  try {
    getit.registerLazySingleton<BlindNumbersViewModel>(
        () => BlindNumbersViewModel());
  } catch (e) {}
}

void registerAimTrainerViewModel() {
  if (getit.isRegistered(instance: AimTrainerViewModel())) return;
  try {
    getit.registerLazySingleton<AimTrainerViewModel>(
        () => AimTrainerViewModel());
  } catch (e) {}
}

void registerVisualMemoryViewModel() {
  if (getit.isRegistered(instance: VisualMemoryViewModel())) return;
  try {
    getit.registerLazySingleton<VisualMemoryViewModel>(
        () => VisualMemoryViewModel());
  } catch (e) {}
}

void registerHoldAndClickViewModel() {
  if (getit.isRegistered(instance: HoldAndClickViewModel())) return;
  try {
    getit.registerLazySingleton<HoldAndClickViewModel>(
        () => HoldAndClickViewModel());
  } catch (e) {}
}

void registerFallingBallsViewModel() {
  if (getit.isRegistered(instance: FallingBallsViewModel())) return;
  try {
    getit.registerLazySingleton<FallingBallsViewModel>(
        () => FallingBallsViewModel());
  } catch (e) {}
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
    getit.registerLazySingleton<CountOneByOneViewModel>(
        () => CountOneByOneViewModel());
  } catch (e) {}
}

void registerColorCellCountViewModel() {
  if (getit.isRegistered(instance: ColorCellCountViewModel())) return;
  try {
    getit.registerLazySingleton<ColorCellCountViewModel>(
        () => ColorCellCountViewModel());
  } catch (e) {}
}

void unregisterPaywallViewModel() =>
    getit.unregister(instance: getit<PaywallViewModel>());

void unregisterHistoryViewModel() =>
    getit.unregister(instance: getit<HistoryViewModel>());

void unregisterBlindInARowViewModel() =>
    getit.unregister(instance: getit<BlindNumbersViewModel>());

void unregisterResultPageViewModel() =>
    getit.unregister(instance: getit<ResultPageViewModel>());

void unregisterAimTrainerViewModel() =>
    getit.unregister(instance: getit<AimTrainerViewModel>());

void unregisterVisualMemoryViewModel() =>
    getit.unregister(instance: getit<VisualMemoryViewModel>());

void unregisterHoldAndClickViewModel() =>
    getit.unregister(instance: getit<HoldAndClickViewModel>());

void unregisterFallingBallsViewModel() =>
    getit.unregister(instance: getit<FallingBallsViewModel>());

void unregisterColorCellCountViewModel() =>
    getit.unregister(instance: getit<ColorCellCountViewModel>());

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