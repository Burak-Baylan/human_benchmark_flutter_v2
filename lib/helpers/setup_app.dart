import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/injection_helper.dart';

class SetupApp {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
    setUpInjections();
  }
}
