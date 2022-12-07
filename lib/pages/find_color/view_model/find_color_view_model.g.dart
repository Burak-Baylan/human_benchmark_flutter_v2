// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_color_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FindColorViewModel on _FindColorViewModelBase, Store {
  late final _$colorListAtom =
      Atom(name: '_FindColorViewModelBase.colorList', context: context);

  @override
  ObservableList<Color> get colorList {
    _$colorListAtom.reportRead();
    return super.colorList;
  }

  @override
  set colorList(ObservableList<Color> value) {
    _$colorListAtom.reportWrite(value, super.colorList, () {
      super.colorList = value;
    });
  }

  late final _$randomColorAtom =
      Atom(name: '_FindColorViewModelBase.randomColor', context: context);

  @override
  Color get randomColor {
    _$randomColorAtom.reportRead();
    return super.randomColor;
  }

  @override
  set randomColor(Color value) {
    _$randomColorAtom.reportWrite(value, super.randomColor, () {
      super.randomColor = value;
    });
  }

  late final _$randomColorTextAtom =
      Atom(name: '_FindColorViewModelBase.randomColorText', context: context);

  @override
  String get randomColorText {
    _$randomColorTextAtom.reportRead();
    return super.randomColorText;
  }

  @override
  set randomColorText(String value) {
    _$randomColorTextAtom.reportWrite(value, super.randomColorText, () {
      super.randomColorText = value;
    });
  }

  late final _$levelCountAtom =
      Atom(name: '_FindColorViewModelBase.levelCount', context: context);

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
      Atom(name: '_FindColorViewModelBase.backgroundColor', context: context);

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

  late final _$_FindColorViewModelBaseActionController =
      ActionController(name: '_FindColorViewModelBase', context: context);

  @override
  void updateRandomNumberString() {
    final _$actionInfo = _$_FindColorViewModelBaseActionController.startAction(
        name: '_FindColorViewModelBase.updateRandomNumberString');
    try {
      return super.updateRandomNumberString();
    } finally {
      _$_FindColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCorrectAnswerBackground() {
    final _$actionInfo = _$_FindColorViewModelBaseActionController.startAction(
        name: '_FindColorViewModelBase.selectCorrectAnswerBackground');
    try {
      return super.selectCorrectAnswerBackground();
    } finally {
      _$_FindColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectWrongAnswerBackground() {
    final _$actionInfo = _$_FindColorViewModelBaseActionController.startAction(
        name: '_FindColorViewModelBase.selectWrongAnswerBackground');
    try {
      return super.selectWrongAnswerBackground();
    } finally {
      _$_FindColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBackground() {
    final _$actionInfo = _$_FindColorViewModelBaseActionController.startAction(
        name: '_FindColorViewModelBase.resetBackground');
    try {
      return super.resetBackground();
    } finally {
      _$_FindColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRandomNumber() {
    final _$actionInfo = _$_FindColorViewModelBaseActionController.startAction(
        name: '_FindColorViewModelBase.changeRandomNumber');
    try {
      return super.changeRandomNumber();
    } finally {
      _$_FindColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
colorList: ${colorList},
randomColor: ${randomColor},
randomColorText: ${randomColorText},
levelCount: ${levelCount},
backgroundColor: ${backgroundColor}
    ''';
  }
}
