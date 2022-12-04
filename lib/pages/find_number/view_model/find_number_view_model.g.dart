// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_number_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FindNumberViewModel on _FindNumberViewModelBase, Store {
  late final _$numberListAtom =
      Atom(name: '_FindNumberViewModelBase.numberList', context: context);

  @override
  ObservableList<int> get numberList {
    _$numberListAtom.reportRead();
    return super.numberList;
  }

  @override
  set numberList(ObservableList<int> value) {
    _$numberListAtom.reportWrite(value, super.numberList, () {
      super.numberList = value;
    });
  }

  late final _$randomNumberAtom =
      Atom(name: '_FindNumberViewModelBase.randomNumber', context: context);

  @override
  int get randomNumber {
    _$randomNumberAtom.reportRead();
    return super.randomNumber;
  }

  @override
  set randomNumber(int value) {
    _$randomNumberAtom.reportWrite(value, super.randomNumber, () {
      super.randomNumber = value;
    });
  }

  late final _$randomNumberTextAtom =
      Atom(name: '_FindNumberViewModelBase.randomNumberText', context: context);

  @override
  String get randomNumberText {
    _$randomNumberTextAtom.reportRead();
    return super.randomNumberText;
  }

  @override
  set randomNumberText(String value) {
    _$randomNumberTextAtom.reportWrite(value, super.randomNumberText, () {
      super.randomNumberText = value;
    });
  }

  late final _$levelCountAtom =
      Atom(name: '_FindNumberViewModelBase.levelCount', context: context);

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

  late final _$backgroundColorAtom =
      Atom(name: '_FindNumberViewModelBase.backgroundColor', context: context);

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

  late final _$_FindNumberViewModelBaseActionController =
      ActionController(name: '_FindNumberViewModelBase', context: context);

  @override
  void updateRandomNumberString() {
    final _$actionInfo = _$_FindNumberViewModelBaseActionController.startAction(
        name: '_FindNumberViewModelBase.updateRandomNumberString');
    try {
      return super.updateRandomNumberString();
    } finally {
      _$_FindNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCorrectAnswerBackground() {
    final _$actionInfo = _$_FindNumberViewModelBaseActionController.startAction(
        name: '_FindNumberViewModelBase.selectCorrectAnswerBackground');
    try {
      return super.selectCorrectAnswerBackground();
    } finally {
      _$_FindNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectWrongAnswerBackground() {
    final _$actionInfo = _$_FindNumberViewModelBaseActionController.startAction(
        name: '_FindNumberViewModelBase.selectWrongAnswerBackground');
    try {
      return super.selectWrongAnswerBackground();
    } finally {
      _$_FindNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBackground() {
    final _$actionInfo = _$_FindNumberViewModelBaseActionController.startAction(
        name: '_FindNumberViewModelBase.resetBackground');
    try {
      return super.resetBackground();
    } finally {
      _$_FindNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRandomNumber() {
    final _$actionInfo = _$_FindNumberViewModelBaseActionController.startAction(
        name: '_FindNumberViewModelBase.changeRandomNumber');
    try {
      return super.changeRandomNumber();
    } finally {
      _$_FindNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numberList: ${numberList},
randomNumber: ${randomNumber},
randomNumberText: ${randomNumberText},
levelCount: ${levelCount},
backgroundColor: ${backgroundColor}
    ''';
  }
}
