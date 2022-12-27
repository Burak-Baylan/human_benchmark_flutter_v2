// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResultPageViewModel on _ResultPageViewModelBase, Store {
  late final _$counterForCongratsWidgetAtom = Atom(
      name: '_ResultPageViewModelBase.counterForCongratsWidget',
      context: context);

  @override
  int get counterForCongratsWidget {
    _$counterForCongratsWidgetAtom.reportRead();
    return super.counterForCongratsWidget;
  }

  @override
  set counterForCongratsWidget(int value) {
    _$counterForCongratsWidgetAtom
        .reportWrite(value, super.counterForCongratsWidget, () {
      super.counterForCongratsWidget = value;
    });
  }

  late final _$showCongratsWidgetAtom = Atom(
      name: '_ResultPageViewModelBase.showCongratsWidget', context: context);

  @override
  bool get showCongratsWidget {
    _$showCongratsWidgetAtom.reportRead();
    return super.showCongratsWidget;
  }

  @override
  set showCongratsWidget(bool value) {
    _$showCongratsWidgetAtom.reportWrite(value, super.showCongratsWidget, () {
      super.showCongratsWidget = value;
    });
  }

  late final _$congratsTextAtom =
      Atom(name: '_ResultPageViewModelBase.congratsText', context: context);

  @override
  String get congratsText {
    _$congratsTextAtom.reportRead();
    return super.congratsText;
  }

  @override
  set congratsText(String value) {
    _$congratsTextAtom.reportWrite(value, super.congratsText, () {
      super.congratsText = value;
    });
  }

  late final _$lottieFileTextAtom =
      Atom(name: '_ResultPageViewModelBase.lottieFileText', context: context);

  @override
  String get lottieFileText {
    _$lottieFileTextAtom.reportRead();
    return super.lottieFileText;
  }

  @override
  set lottieFileText(String value) {
    _$lottieFileTextAtom.reportWrite(value, super.lottieFileText, () {
      super.lottieFileText = value;
    });
  }

  late final _$showingItemAtom =
      Atom(name: '_ResultPageViewModelBase.showingItem', context: context);

  @override
  int get showingItem {
    _$showingItemAtom.reportRead();
    return super.showingItem;
  }

  @override
  set showingItem(int value) {
    _$showingItemAtom.reportWrite(value, super.showingItem, () {
      super.showingItem = value;
    });
  }

  late final _$_ResultPageViewModelBaseActionController =
      ActionController(name: '_ResultPageViewModelBase', context: context);

  @override
  void closeCongratsWidget() {
    final _$actionInfo = _$_ResultPageViewModelBaseActionController.startAction(
        name: '_ResultPageViewModelBase.closeCongratsWidget');
    try {
      return super.closeCongratsWidget();
    } finally {
      _$_ResultPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openCongratsWidget() {
    final _$actionInfo = _$_ResultPageViewModelBaseActionController.startAction(
        name: '_ResultPageViewModelBase.openCongratsWidget');
    try {
      return super.openCongratsWidget();
    } finally {
      _$_ResultPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterForCongratsWidget: ${counterForCongratsWidget},
showCongratsWidget: ${showCongratsWidget},
congratsText: ${congratsText},
lottieFileText: ${lottieFileText},
showingItem: ${showingItem}
    ''';
  }
}
