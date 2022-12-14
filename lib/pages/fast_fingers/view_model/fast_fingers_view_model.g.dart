// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_fingers_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FastFingersViewModel on _FastFingersViewModelBase, Store {
  late final _$clickCountAtom =
      Atom(name: '_FastFingersViewModelBase.clickCount', context: context);

  @override
  int get clickCount {
    _$clickCountAtom.reportRead();
    return super.clickCount;
  }

  @override
  set clickCount(int value) {
    _$clickCountAtom.reportWrite(value, super.clickCount, () {
      super.clickCount = value;
    });
  }

  late final _$counterAtom =
      Atom(name: '_FastFingersViewModelBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_FastFingersViewModelBaseActionController =
      ActionController(name: '_FastFingersViewModelBase', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_FastFingersViewModelBaseActionController
        .startAction(name: '_FastFingersViewModelBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_FastFingersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clickCount: ${clickCount},
counter: ${counter}
    ''';
  }
}
