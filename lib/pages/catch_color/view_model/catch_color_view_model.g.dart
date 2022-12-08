// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catch_color_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatchColorViewModel on _CatchColorViewModelBase, Store {
  late final _$levelCountAtom =
      Atom(name: '_CatchColorViewModelBase.levelCount', context: context);

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
      Atom(name: '_CatchColorViewModelBase.backgroundColor', context: context);

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

  late final _$selectedIndexAtom =
      Atom(name: '_CatchColorViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_CatchColorViewModelBaseActionController =
      ActionController(name: '_CatchColorViewModelBase', context: context);

  @override
  void selectIndex() {
    final _$actionInfo = _$_CatchColorViewModelBaseActionController.startAction(
        name: '_CatchColorViewModelBase.selectIndex');
    try {
      return super.selectIndex();
    } finally {
      _$_CatchColorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
levelCount: ${levelCount},
backgroundColor: ${backgroundColor},
selectedIndex: ${selectedIndex}
    ''';
  }
}
