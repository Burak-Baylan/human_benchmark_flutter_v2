// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_memory_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisualMemoryViewModel on _VisualMemoryViewModelBase, Store {
  late final _$dotsLocationsAtom =
      Atom(name: '_VisualMemoryViewModelBase.dotsLocations', context: context);

  @override
  ObservableList<int> get dotsLocations {
    _$dotsLocationsAtom.reportRead();
    return super.dotsLocations;
  }

  @override
  set dotsLocations(ObservableList<int> value) {
    _$dotsLocationsAtom.reportWrite(value, super.dotsLocations, () {
      super.dotsLocations = value;
    });
  }

  late final _$openedBoxesAtom =
      Atom(name: '_VisualMemoryViewModelBase.openedBoxes', context: context);

  @override
  ObservableList<int> get openedBoxes {
    _$openedBoxesAtom.reportRead();
    return super.openedBoxes;
  }

  @override
  set openedBoxes(ObservableList<int> value) {
    _$openedBoxesAtom.reportWrite(value, super.openedBoxes, () {
      super.openedBoxes = value;
    });
  }

  late final _$isBoxesOpenAtom =
      Atom(name: '_VisualMemoryViewModelBase.isBoxesOpen', context: context);

  @override
  bool get isBoxesOpen {
    _$isBoxesOpenAtom.reportRead();
    return super.isBoxesOpen;
  }

  @override
  set isBoxesOpen(bool value) {
    _$isBoxesOpenAtom.reportWrite(value, super.isBoxesOpen, () {
      super.isBoxesOpen = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_VisualMemoryViewModelBase.backgroundColor', context: context);

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
      Atom(name: '_VisualMemoryViewModelBase.levelCount', context: context);

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

  late final _$isNextRoundTextOpenAtom = Atom(
      name: '_VisualMemoryViewModelBase.isNextRoundTextOpen', context: context);

  @override
  bool get isNextRoundTextOpen {
    _$isNextRoundTextOpenAtom.reportRead();
    return super.isNextRoundTextOpen;
  }

  @override
  set isNextRoundTextOpen(bool value) {
    _$isNextRoundTextOpenAtom.reportWrite(value, super.isNextRoundTextOpen, () {
      super.isNextRoundTextOpen = value;
    });
  }

  @override
  String toString() {
    return '''
dotsLocations: ${dotsLocations},
openedBoxes: ${openedBoxes},
isBoxesOpen: ${isBoxesOpen},
backgroundColor: ${backgroundColor},
levelCount: ${levelCount},
isNextRoundTextOpen: ${isNextRoundTextOpen}
    ''';
  }
}
