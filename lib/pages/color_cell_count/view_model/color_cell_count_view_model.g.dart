// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_cell_count_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ColorCellCountViewModel on _ColorCellCountViewModelBase, Store {
  late final _$colorListAtom =
      Atom(name: '_ColorCellCountViewModelBase.colorList', context: context);

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

  late final _$answersAtom =
      Atom(name: '_ColorCellCountViewModelBase.answers', context: context);

  @override
  ObservableList<int> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(ObservableList<int> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_ColorCellCountViewModelBase.backgroundColor', context: context);

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
      Atom(name: '_ColorCellCountViewModelBase.levelCount', context: context);

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

  late final _$_ColorCellCountViewModelBaseActionController =
      ActionController(name: '_ColorCellCountViewModelBase', context: context);

  @override
  void fillColorList() {
    final _$actionInfo = _$_ColorCellCountViewModelBaseActionController
        .startAction(name: '_ColorCellCountViewModelBase.fillColorList');
    try {
      return super.fillColorList();
    } finally {
      _$_ColorCellCountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userClicked(int index) {
    final _$actionInfo = _$_ColorCellCountViewModelBaseActionController
        .startAction(name: '_ColorCellCountViewModelBase.userClicked');
    try {
      return super.userClicked(index);
    } finally {
      _$_ColorCellCountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
colorList: ${colorList},
answers: ${answers},
backgroundColor: ${backgroundColor},
levelCount: ${levelCount}
    ''';
  }
}
