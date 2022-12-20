// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'math_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MathViewModel on _MathViewModelBase, Store {
  late final _$levelCountAtom =
      Atom(name: '_MathViewModelBase.levelCount', context: context);

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

  late final _$resultsAtom =
      Atom(name: '_MathViewModelBase.results', context: context);

  @override
  ObservableList<String> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableList<String> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$problemStringAtom =
      Atom(name: '_MathViewModelBase.problemString', context: context);

  @override
  String get problemString {
    _$problemStringAtom.reportRead();
    return super.problemString;
  }

  @override
  set problemString(String value) {
    _$problemStringAtom.reportWrite(value, super.problemString, () {
      super.problemString = value;
    });
  }

  late final _$_MathViewModelBaseActionController =
      ActionController(name: '_MathViewModelBase', context: context);

  @override
  void createResultsList() {
    final _$actionInfo = _$_MathViewModelBaseActionController.startAction(
        name: '_MathViewModelBase.createResultsList');
    try {
      return super.createResultsList();
    } finally {
      _$_MathViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createResultsListAsOperation() {
    final _$actionInfo = _$_MathViewModelBaseActionController.startAction(
        name: '_MathViewModelBase.createResultsListAsOperation');
    try {
      return super.createResultsListAsOperation();
    } finally {
      _$_MathViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
levelCount: ${levelCount},
results: ${results},
problemString: ${problemString}
    ''';
  }
}
