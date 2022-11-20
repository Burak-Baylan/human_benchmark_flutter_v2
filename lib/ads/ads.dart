import 'package:get/get.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_banner.dart';
import 'ad_interstitial.dart';
import 'controller/ads_controller.dart';

class Ads {
  Ads() {
    _initializeValues();
  }

  _initializeValues() {
    return;
    //_initGoogleMobileAds();
  }

//  Future<InitializationStatus> _initGoogleMobileAds() =>
//      MobileAds.instance.initialize();
//
//  static AdWidget homeBanner({
//    required void Function(Ad ad) onAdLoaded,
//    required void Function(Ad ad, LoadAdError error) onAdFailedToUpload,
//  }) {
//     return AdBanner(onLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToUpload)
//          .bannerAd('AdsId.homeBannerId', Get.find<AdsController>().homeBanner.value);
//  }
//
//  static loadSeqMemoryWrongAnswerInterstitial({
//    required void Function(InterstitialAd ad) onAdLoaded,
//    required void Function(LoadAdError error) onAdFailedToLoad,
//  }) =>
//      AdInterstitial.load(
//        adUnitId: 'AdsId.sequenceMemoryWrongAnswerInterstitalId',
//        onAdLoaded: (ad) => onAdLoaded(ad),
//        onAdFailedToLoad: (error) => onAdFailedToLoad(error),
//      );
}
