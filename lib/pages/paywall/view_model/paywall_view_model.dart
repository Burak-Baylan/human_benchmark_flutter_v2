// ignore_for_file: empty_catches

import 'package:human_benchmark_flutter_v2/helpers/colorful_print.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/purchase_helper.dart';

part 'paywall_view_model.g.dart';

class PaywallViewModel = _PaywallViewModelBase with _$PaywallViewModel;

abstract class _PaywallViewModelBase with Store {
  @observable
  bool isLoading = false;

  Future<bool> purcaseForOnboardingPaywall() async {
    print('A905281 aaaaa');
    if (PurchaseHelper.shared.weekly == null) return false;
    isLoading = true;
    print('A905281 true');
    var isPurchased = await PurchaseHelper.shared
        .purchase(PurchaseHelper.shared.weekly!);
    isLoading = false;
    print('A905281 false | Is Purchased: $isPurchased');
    return isPurchased;
  }
}
