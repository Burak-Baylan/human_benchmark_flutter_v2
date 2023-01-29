// ignore_for_file: empty_catches

import 'package:mobx/mobx.dart';

part 'paywall_view_model.g.dart';

class PaywallViewModel = _PaywallViewModelBase with _$PaywallViewModel;

abstract class _PaywallViewModelBase with Store {
  @observable
  bool isLoading = false;
}
