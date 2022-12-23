// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hold_and_click_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HoldAndClickViewModel on _HoldAndClickViewModelBase, Store {
  late final _$coloredBoxIndexAtom = Atom(
      name: '_HoldAndClickViewModelBase.coloredBoxIndex', context: context);

  @override
  int get coloredBoxIndex {
    _$coloredBoxIndexAtom.reportRead();
    return super.coloredBoxIndex;
  }

  @override
  set coloredBoxIndex(int value) {
    _$coloredBoxIndexAtom.reportWrite(value, super.coloredBoxIndex, () {
      super.coloredBoxIndex = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_HoldAndClickViewModelBase.backgroundColor', context: context);

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
      Atom(name: '_HoldAndClickViewModelBase.levelCount', context: context);

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

  late final _$fingerHoldingAtom =
      Atom(name: '_HoldAndClickViewModelBase.fingerHolding', context: context);

  @override
  bool get fingerHolding {
    _$fingerHoldingAtom.reportRead();
    return super.fingerHolding;
  }

  @override
  set fingerHolding(bool value) {
    _$fingerHoldingAtom.reportWrite(value, super.fingerHolding, () {
      super.fingerHolding = value;
    });
  }

  @override
  String toString() {
    return '''
coloredBoxIndex: ${coloredBoxIndex},
backgroundColor: ${backgroundColor},
levelCount: ${levelCount},
fingerHolding: ${fingerHolding}
    ''';
  }
}
