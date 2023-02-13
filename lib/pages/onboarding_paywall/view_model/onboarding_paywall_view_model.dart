import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'onboarding_paywall_view_model.g.dart';

class OnboardingPaywallViewModel = _OnboardingPaywallViewModelBase with _$OnboardingPaywallViewModel;

abstract class _OnboardingPaywallViewModelBase with Store {
  @observable
  int currentPageViewIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
  );
  bool isEnd = false;

  late Timer _timer;

  @action
  void changePageViewIndex(int index) => currentPageViewIndex = index;

  String get getDateStr {
    var now = DateTime.now();

    var formatter = DateFormat('MMM');
    String formattedDate1 = formatter.format(now);
    String dateStr1 = '${now.day} $formattedDate1';

    var date2 = now.add(const Duration(days: 2));
    String formattedDate2 = formatter.format(date2);
    String dateStr2 = '${date2.day} $formattedDate2';

    return '$dateStr1. - $dateStr2.';
  }

  void startPageView() {
    try {
      _timer.cancel();
    } catch (e) {}
    pageController = PageController(
      initialPage: 0,
    );
    isEnd = false;
    changePageViewIndex(0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPageViewIndex == 2) {
        isEnd = true;
      } else if (currentPageViewIndex == 0) {
        isEnd = false;
      }
      if (isEnd == false) {
        changePageViewIndex(currentPageViewIndex + 1);
      } else {
        changePageViewIndex(currentPageViewIndex - 1);
      }
      try {
        pageController.animateToPage(
          currentPageViewIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } catch (e) {}
    });
  }
}