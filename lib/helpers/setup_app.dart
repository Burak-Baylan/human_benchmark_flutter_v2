import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_helper.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_manager.dart';
import 'package:human_benchmark_flutter_v2/main.dart';
import 'package:human_benchmark_flutter_v2/utils/purchase_helper.dart';
import '../core/hive/hive_constants.dart';
import '../utils/injection_helper.dart';
import 'get_storage_helper.dart';

class SetupApp {
  static Future<void> setup() async {
    mainVm.isPurchaseChecked = false;
    await HiveHelper.instance.initHive();
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    await AdManager.loadAllInterstitialAds();
    await PurchaseHelper.shared.initPurchase();
    await GetStorageHelper.shared.init();
    mainVm.seenOnboard =
        GetStorageHelper.shared.read(HiveConstants.seenOnboard) ?? false;
    var unlockedGames = await HiveManager.getUnlockedGames();
    if (unlockedGames != null) {
      mainVm.unlockedGames.clear();
      mainVm.unlockedGames.addAll(unlockedGames);
    }
    await PurchaseHelper.shared.loadProducts();
    setUpInjections();
    mainVm.isPurchaseChecked = true;
  }
}
