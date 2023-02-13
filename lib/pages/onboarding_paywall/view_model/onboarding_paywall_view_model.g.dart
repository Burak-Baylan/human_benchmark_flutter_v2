// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_paywall_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingPaywallViewModel on _OnboardingPaywallViewModelBase, Store {
  late final _$currentPageViewIndexAtom = Atom(
      name: '_OnboardingPaywallViewModelBase.currentPageViewIndex',
      context: context);

  @override
  int get currentPageViewIndex {
    _$currentPageViewIndexAtom.reportRead();
    return super.currentPageViewIndex;
  }

  @override
  set currentPageViewIndex(int value) {
    _$currentPageViewIndexAtom.reportWrite(value, super.currentPageViewIndex,
        () {
      super.currentPageViewIndex = value;
    });
  }

  late final _$_OnboardingPaywallViewModelBaseActionController =
      ActionController(
          name: '_OnboardingPaywallViewModelBase', context: context);

  @override
  void changePageViewIndex(int index) {
    final _$actionInfo =
        _$_OnboardingPaywallViewModelBaseActionController.startAction(
            name: '_OnboardingPaywallViewModelBase.changePageViewIndex');
    try {
      return super.changePageViewIndex(index);
    } finally {
      _$_OnboardingPaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageViewIndex: ${currentPageViewIndex}
    ''';
  }
}
