import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../helpers/unlocked_next_game_alert.dart';
import '../../../main.dart';

part 'result_page_view_model.g.dart';

class ResultPageViewModel = _ResultPageViewModelBase with _$ResultPageViewModel;

abstract class _ResultPageViewModelBase with Store {
  late BuildContext contextt;

  void setContext(BuildContext context) => contextt = context;

  @observable
  int counterForCongratsWidget = 15;
  @observable
  bool showCongratsWidget = false;
  @action
  void closeCongratsWidget() => showCongratsWidget = false;
  @action
  void openCongratsWidget() => showCongratsWidget = true;
  @observable
  String congratsText =
      'Congratulations, your score is slightly above average!';
  @observable
  String lottieFileText = 'assets/lotties/confetti.json';
  String slightlyAboveText = 'Congratulations, your score is above average!';
  String wellAboveText = 'Congratulations, your score is well above average!';
  String confettiLottieText = 'assets/lotties/confetti.json';
  String badgeLottieText = 'assets/lotties/congratulation_badge.json';

  @observable
  int showingItem = 9999;

  late Timer timer;

  void showYouUnclokedNextGameAlert(int currentGameIndex) {
    if (showingItem != 0 && showingItem != 1) return;
    if (mainVm.unlockedGames.contains(currentGameIndex) &&
        showYouUnlockedNextGameAlertState == false) return;
    showYouUnlockedNextGameAlert(contextt);
    showYouUnlockedNextGameAlertState = false;
  }

  void startPage(bool showBadge, bool showConfetti) {
    if (!showBadge && !showConfetti) return;
    openCongratsWidget();
    prepareValues(showBadge, showConfetti);
    startTimer();
  }

  bool showYouUnlockedNextGameAlertState = false;

  void openNextLevel(int currentGameIndex) {
    if (showingItem == 0 || showingItem == 1) {
      if (mainVm.unlockedGames.contains(currentGameIndex)) return;
      showYouUnlockedNextGameAlertState = true;
      mainVm.unlockedGames.add(currentGameIndex);
    }
  }

  void prepareValues(bool showBadge, bool showConfetti) {
    if (showBadge) {
      congratsText = wellAboveText;
      lottieFileText = badgeLottieText;
      showingItem = 1;
      return;
    }
    if (showConfetti) {
      congratsText = slightlyAboveText;
      lottieFileText = confettiLottieText;
      showingItem = 0;
      return;
    }
  }

  void startTimer() {
    const time = Duration(milliseconds: 1000);
    timer = Timer.periodic(
      time,
      (Timer timer) {
        if (counterForCongratsWidget == 0) {
          closeCongratsWidget();
          return;
        }
        counterForCongratsWidget--;
      },
    );
  }
}
