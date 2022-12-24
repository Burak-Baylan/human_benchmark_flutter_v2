// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_trainer_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AimTrainerViewModel on _AimTrainerViewModelBase, Store {
  late final _$ballWidgetsListAtom =
      Atom(name: '_AimTrainerViewModelBase.ballWidgetsList', context: context);

  @override
  ObservableList<Widget> get ballWidgetsList {
    _$ballWidgetsListAtom.reportRead();
    return super.ballWidgetsList;
  }

  @override
  set ballWidgetsList(ObservableList<Widget> value) {
    _$ballWidgetsListAtom.reportWrite(value, super.ballWidgetsList, () {
      super.ballWidgetsList = value;
    });
  }

  late final _$backgroundColorAtom =
      Atom(name: '_AimTrainerViewModelBase.backgroundColor', context: context);

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

  late final _$isPlayButtonVisibleAtom = Atom(
      name: '_AimTrainerViewModelBase.isPlayButtonVisible', context: context);

  @override
  bool get isPlayButtonVisible {
    _$isPlayButtonVisibleAtom.reportRead();
    return super.isPlayButtonVisible;
  }

  @override
  set isPlayButtonVisible(bool value) {
    _$isPlayButtonVisibleAtom.reportWrite(value, super.isPlayButtonVisible, () {
      super.isPlayButtonVisible = value;
    });
  }

  late final _$ballCountAtom =
      Atom(name: '_AimTrainerViewModelBase.ballCount', context: context);

  @override
  int get ballCount {
    _$ballCountAtom.reportRead();
    return super.ballCount;
  }

  @override
  set ballCount(int value) {
    _$ballCountAtom.reportWrite(value, super.ballCount, () {
      super.ballCount = value;
    });
  }

  late final _$isFirstLevelAtom =
      Atom(name: '_AimTrainerViewModelBase.isFirstLevel', context: context);

  @override
  bool get isFirstLevel {
    _$isFirstLevelAtom.reportRead();
    return super.isFirstLevel;
  }

  @override
  set isFirstLevel(bool value) {
    _$isFirstLevelAtom.reportWrite(value, super.isFirstLevel, () {
      super.isFirstLevel = value;
    });
  }

  late final _$levelCountAtom =
      Atom(name: '_AimTrainerViewModelBase.levelCount', context: context);

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

  late final _$_AimTrainerViewModelBaseActionController =
      ActionController(name: '_AimTrainerViewModelBase', context: context);

  @override
  void changeIsFirstLevelState(bool state) {
    final _$actionInfo = _$_AimTrainerViewModelBaseActionController.startAction(
        name: '_AimTrainerViewModelBase.changeIsFirstLevelState');
    try {
      return super.changeIsFirstLevelState(state);
    } finally {
      _$_AimTrainerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ballWidgetsList: ${ballWidgetsList},
backgroundColor: ${backgroundColor},
isPlayButtonVisible: ${isPlayButtonVisible},
ballCount: ${ballCount},
isFirstLevel: ${isFirstLevel},
levelCount: ${levelCount}
    ''';
  }
}
