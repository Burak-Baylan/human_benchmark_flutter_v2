// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'falling_balls_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FallingBallsViewModel on _FallingBallsViewModelBase, Store {
  late final _$positionYAtom =
      Atom(name: '_FallingBallsViewModelBase.positionY', context: context);

  @override
  double get positionY {
    _$positionYAtom.reportRead();
    return super.positionY;
  }

  @override
  set positionY(double value) {
    _$positionYAtom.reportWrite(value, super.positionY, () {
      super.positionY = value;
    });
  }

  late final _$gameDurationAtom =
      Atom(name: '_FallingBallsViewModelBase.gameDuration', context: context);

  @override
  int get gameDuration {
    _$gameDurationAtom.reportRead();
    return super.gameDuration;
  }

  @override
  set gameDuration(int value) {
    _$gameDurationAtom.reportWrite(value, super.gameDuration, () {
      super.gameDuration = value;
    });
  }

  late final _$positionsAtom =
      Atom(name: '_FallingBallsViewModelBase.positions', context: context);

  @override
  ObservableList<double> get positions {
    _$positionsAtom.reportRead();
    return super.positions;
  }

  @override
  set positions(ObservableList<double> value) {
    _$positionsAtom.reportWrite(value, super.positions, () {
      super.positions = value;
    });
  }

  late final _$ballsAtom =
      Atom(name: '_FallingBallsViewModelBase.balls', context: context);

  @override
  ObservableList<Widget> get balls {
    _$ballsAtom.reportRead();
    return super.balls;
  }

  @override
  set balls(ObservableList<Widget> value) {
    _$ballsAtom.reportWrite(value, super.balls, () {
      super.balls = value;
    });
  }

  late final _$_FallingBallsViewModelBaseActionController =
      ActionController(name: '_FallingBallsViewModelBase', context: context);

  @override
  void moveBall(int index) {
    final _$actionInfo = _$_FallingBallsViewModelBaseActionController
        .startAction(name: '_FallingBallsViewModelBase.moveBall');
    try {
      return super.moveBall(index);
    } finally {
      _$_FallingBallsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
positionY: ${positionY},
gameDuration: ${gameDuration},
positions: ${positions},
balls: ${balls}
    ''';
  }
}
