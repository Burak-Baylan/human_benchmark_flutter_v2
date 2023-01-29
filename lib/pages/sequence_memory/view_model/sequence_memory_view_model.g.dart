// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_memory_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SequenceMemoryViewModel on _SequenceMemoryViewModelBase, Store {
  late final _$pageAtom =
      Atom(name: '_SequenceMemoryViewModelBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$backGroundColorAtom = Atom(
      name: '_SequenceMemoryViewModelBase.backGroundColor', context: context);

  @override
  Color get backGroundColor {
    _$backGroundColorAtom.reportRead();
    return super.backGroundColor;
  }

  @override
  set backGroundColor(Color value) {
    _$backGroundColorAtom.reportWrite(value, super.backGroundColor, () {
      super.backGroundColor = value;
    });
  }

  late final _$cardColorsAtom =
      Atom(name: '_SequenceMemoryViewModelBase.cardColors', context: context);

  @override
  ObservableList<Color> get cardColors {
    _$cardColorsAtom.reportRead();
    return super.cardColors;
  }

  @override
  set cardColors(ObservableList<Color> value) {
    _$cardColorsAtom.reportWrite(value, super.cardColors, () {
      super.cardColors = value;
    });
  }

  late final _$userClickCounterAtom = Atom(
      name: '_SequenceMemoryViewModelBase.userClickCounter', context: context);

  @override
  int get userClickCounter {
    _$userClickCounterAtom.reportRead();
    return super.userClickCounter;
  }

  @override
  set userClickCounter(int value) {
    _$userClickCounterAtom.reportWrite(value, super.userClickCounter, () {
      super.userClickCounter = value;
    });
  }

  late final _$stepsWidgetAtom =
      Atom(name: '_SequenceMemoryViewModelBase.stepsWidget', context: context);

  @override
  List<Widget> get stepsWidget {
    _$stepsWidgetAtom.reportRead();
    return super.stepsWidget;
  }

  @override
  set stepsWidget(List<Widget> value) {
    _$stepsWidgetAtom.reportWrite(value, super.stepsWidget, () {
      super.stepsWidget = value;
    });
  }

  late final _$_SequenceMemoryViewModelBaseActionController =
      ActionController(name: '_SequenceMemoryViewModelBase', context: context);

  @override
  void closeClickable() {
    final _$actionInfo = _$_SequenceMemoryViewModelBaseActionController
        .startAction(name: '_SequenceMemoryViewModelBase.closeClickable');
    try {
      return super.closeClickable();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openClickable() {
    final _$actionInfo = _$_SequenceMemoryViewModelBaseActionController
        .startAction(name: '_SequenceMemoryViewModelBase.openClickable');
    try {
      return super.openClickable();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectInfoPage() {
    final _$actionInfo = _$_SequenceMemoryViewModelBaseActionController
        .startAction(name: '_SequenceMemoryViewModelBase.selectInfoPage');
    try {
      return super.selectInfoPage();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectGamePage() {
    final _$actionInfo = _$_SequenceMemoryViewModelBaseActionController
        .startAction(name: '_SequenceMemoryViewModelBase.selectGamePage');
    try {
      return super.selectGamePage();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectWrongAnswerPage() {
    final _$actionInfo =
        _$_SequenceMemoryViewModelBaseActionController.startAction(
            name: '_SequenceMemoryViewModelBase.selectWrongAnswerPage');
    try {
      return super.selectWrongAnswerPage();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCorrectAnswerBackground() {
    final _$actionInfo =
        _$_SequenceMemoryViewModelBaseActionController.startAction(
            name: '_SequenceMemoryViewModelBase.selectCorrectAnswerBackground');
    try {
      return super.selectCorrectAnswerBackground();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBackground() {
    final _$actionInfo = _$_SequenceMemoryViewModelBaseActionController
        .startAction(name: '_SequenceMemoryViewModelBase.resetBackground');
    try {
      return super.resetBackground();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementUserClickCounter() {
    final _$actionInfo =
        _$_SequenceMemoryViewModelBaseActionController.startAction(
            name: '_SequenceMemoryViewModelBase.incrementUserClickCounter');
    try {
      return super.incrementUserClickCounter();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetUserClickCounter() {
    final _$actionInfo =
        _$_SequenceMemoryViewModelBaseActionController.startAction(
            name: '_SequenceMemoryViewModelBase.resetUserClickCounter');
    try {
      return super.resetUserClickCounter();
    } finally {
      _$_SequenceMemoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
backGroundColor: ${backGroundColor},
cardColors: ${cardColors},
userClickCounter: ${userClickCounter},
stepsWidget: ${stepsWidget}
    ''';
  }
}
