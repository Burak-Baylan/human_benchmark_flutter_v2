import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_manager.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_helper.dart';
import '../utils/injection_helper.dart';

class SetupApp {
  static Future<void> setup() async {
    await HiveHelper.instance.initHive();
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    await AdManager.loadAllInterstitialAds();
    setUpInjections();
  }
}
