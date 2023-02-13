// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$unlockedGamesAtom =
      Atom(name: '_MainViewModelBase.unlockedGames', context: context);

  @override
  ObservableList<int> get unlockedGames {
    _$unlockedGamesAtom.reportRead();
    return super.unlockedGames;
  }

  @override
  set unlockedGames(ObservableList<int> value) {
    _$unlockedGamesAtom.reportWrite(value, super.unlockedGames, () {
      super.unlockedGames = value;
    });
  }

  late final _$isPurchaseCheckedAtom =
      Atom(name: '_MainViewModelBase.isPurchaseChecked', context: context);

  @override
  bool get isPurchaseChecked {
    _$isPurchaseCheckedAtom.reportRead();
    return super.isPurchaseChecked;
  }

  @override
  set isPurchaseChecked(bool value) {
    _$isPurchaseCheckedAtom.reportWrite(value, super.isPurchaseChecked, () {
      super.isPurchaseChecked = value;
    });
  }

  late final _$onboardJustCompletedAtom =
      Atom(name: '_MainViewModelBase.onboardJustCompleted', context: context);

  @override
  bool get onboardJustCompleted {
    _$onboardJustCompletedAtom.reportRead();
    return super.onboardJustCompleted;
  }

  @override
  set onboardJustCompleted(bool value) {
    _$onboardJustCompletedAtom.reportWrite(value, super.onboardJustCompleted,
        () {
      super.onboardJustCompleted = value;
    });
  }

  late final _$isPremiumAtom =
      Atom(name: '_MainViewModelBase.isPremium', context: context);

  @override
  bool get isPremium {
    _$isPremiumAtom.reportRead();
    return super.isPremium;
  }

  @override
  set isPremium(bool value) {
    _$isPremiumAtom.reportWrite(value, super.isPremium, () {
      super.isPremium = value;
    });
  }

  @override
  String toString() {
    return '''
unlockedGames: ${unlockedGames},
isPurchaseChecked: ${isPurchaseChecked},
onboardJustCompleted: ${onboardJustCompleted},
isPremium: ${isPremium}
    ''';
  }
}
