// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blind_numbers_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BlindNumbersViewModel on _BlindNumbersViewModelBase, Store {
  late final _$levelCountAtom =
      Atom(name: '_BlindNumbersViewModelBase.levelCount', context: context);

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

  late final _$ballCountAtom =
      Atom(name: '_BlindNumbersViewModelBase.ballCount', context: context);

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

  late final _$closedBallsAtom =
      Atom(name: '_BlindNumbersViewModelBase.closedBalls', context: context);

  @override
  ObservableList<int> get closedBalls {
    _$closedBallsAtom.reportRead();
    return super.closedBalls;
  }

  @override
  set closedBalls(ObservableList<int> value) {
    _$closedBallsAtom.reportWrite(value, super.closedBalls, () {
      super.closedBalls = value;
    });
  }

  late final _$closeBallsAtom =
      Atom(name: '_BlindNumbersViewModelBase.closeBalls', context: context);

  @override
  bool get closeBalls {
    _$closeBallsAtom.reportRead();
    return super.closeBalls;
  }

  @override
  set closeBalls(bool value) {
    _$closeBallsAtom.reportWrite(value, super.closeBalls, () {
      super.closeBalls = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_BlindNumbersViewModelBase.backgroundColor', context: context);

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

  late final _$ballWidgetsListAtom = Atom(
      name: '_BlindNumbersViewModelBase.ballWidgetsList', context: context);

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

  @override
  String toString() {
    return '''
levelCount: ${levelCount},
ballCount: ${ballCount},
closedBalls: ${closedBalls},
closeBalls: ${closeBalls},
backgroundColor: ${backgroundColor},
ballWidgetsList: ${ballWidgetsList}
    ''';
  }
}
