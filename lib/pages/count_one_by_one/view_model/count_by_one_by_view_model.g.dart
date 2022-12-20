// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_by_one_by_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CountOneByOneViewModel on _CountOneByOneViewModelBase, Store {
  late final _$backgroundColorAtom = Atom(
      name: '_CountOneByOneViewModelBase.backgroundColor', context: context);

  @override
  Color get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  late final _$levelCountAtom =
      Atom(name: '_CountOneByOneViewModelBase.levelCount', context: context);

  @override
  int get levelCount {
    _$levelCountAtom.reportRead();
    return super.levelCount;
  }

  @override
  set levelCount(int value) {
    _$levelCountAtom.reportWrite(value, super.levelCount, () {
      super.levelCount = value;
    });
  }

  late final _$wrongAnswerSignalAsyncAction = AsyncAction(
      '_CountOneByOneViewModelBase.wrongAnswerSignal',
      context: context);

  @override
  Future<void> wrongAnswerSignal() {
    return _$wrongAnswerSignalAsyncAction.run(() => super.wrongAnswerSignal());
  }

  late final _$correctAnswerSignalAsyncAction = AsyncAction(
      '_CountOneByOneViewModelBase.correctAnswerSignal',
      context: context);

  @override
  Future<void> correctAnswerSignal() {
    return _$correctAnswerSignalAsyncAction
        .run(() => super.correctAnswerSignal());
  }

  late final _$_CountOneByOneViewModelBaseActionController =
      ActionController(name: '_CountOneByOneViewModelBase', context: context);

  @override
  void userClick(String number) {
    final _$actionInfo = _$_CountOneByOneViewModelBaseActionController
        .startAction(name: '_CountOneByOneViewModelBase.userClick');
    try {
      return super.userClick(number);
    } finally {
      _$_CountOneByOneViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
backgroundColor: ${backgroundColor},
levelCount: ${levelCount}
    ''';
  }
}
