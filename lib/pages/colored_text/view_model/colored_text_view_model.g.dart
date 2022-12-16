// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colored_text_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ColoredTextViewModel on _ColoredTextViewModelBase, Store {
  late final _$levelCountAtom =
      Atom(name: '_ColoredTextViewModelBase.levelCount', context: context);

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

  late final _$changingColorAtom =
      Atom(name: '_ColoredTextViewModelBase.changingColor', context: context);

  @override
  Color get changingColor {
    _$changingColorAtom.reportRead();
    return super.changingColor;
  }

  @override
  set changingColor(Color value) {
    _$changingColorAtom.reportWrite(value, super.changingColor, () {
      super.changingColor = value;
    });
  }

  late final _$changingTextAtom =
      Atom(name: '_ColoredTextViewModelBase.changingText', context: context);

  @override
  String get changingText {
    _$changingTextAtom.reportRead();
    return super.changingText;
  }

  @override
  set changingText(String value) {
    _$changingTextAtom.reportWrite(value, super.changingText, () {
      super.changingText = value;
    });
  }

  late final _$_ColoredTextViewModelBaseActionController =
      ActionController(name: '_ColoredTextViewModelBase', context: context);

  @override
  void changeColorAndText() {
    final _$actionInfo = _$_ColoredTextViewModelBaseActionController
        .startAction(name: '_ColoredTextViewModelBase.changeColorAndText');
    try {
      return super.changeColorAndText();
    } finally {
      _$_ColoredTextViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
levelCount: ${levelCount},
changingColor: ${changingColor},
changingText: ${changingText}
    ''';
  }
}
