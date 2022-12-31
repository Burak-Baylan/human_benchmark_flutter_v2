import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/helpers/colorful_print.dart';

import '../ads/ad_banner.dart';

class DefaultBannerAd extends StatelessWidget {
  DefaultBannerAd({
    super.key,
    required this.adId,
    this.name,
  });

  String? name;
  String adId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AdSize.banner.width.toDouble(),
      height: AdSize.banner.height.toDouble(),
      child: AdBanner(
        onLoaded: (x) {
          ColorfulPrint.yellow('$name banner ad LOADED');
        },
        onAdFailedToLoad: (x, error) {
          ColorfulPrint.red('$name banner ad LOAD FAILED. Error: $error');
        },
      ).bannerAd(adId),
    );
  }
}
