import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner {
  set onAdLoaded(Function(Ad ad)? onLoaded) => _onAdLoaded = onLoaded;
  set onAdFailedToLoad(Function(Ad ad, LoadAdError error)? onAdFailedToLoad) =>
      _onAdFailedToLoad = onAdFailedToLoad;

  AdBanner({
    required Function(Ad ad)? onLoaded,
    required Function(Ad ad, LoadAdError error)? onAdFailedToLoad,
  }) {
    _onAdLoaded = onLoaded;
    _onAdFailedToLoad = onAdFailedToLoad;
  }

  String? _adId;
  Function(Ad ad)? _onAdLoaded;
  Function(Ad ad, LoadAdError error)? _onAdFailedToLoad;
  late BannerAd _banner;

  AdWidget bannerAd(String adUnitId) {
    _adId = adUnitId;
    var bannerW = _bannerAdW();
    bannerW.load();
    return AdWidget(ad: bannerW);
  }

  BannerAd _bannerAdW() {
    BannerAd banner = getBanner();
    _banner = banner;
    return banner;
  }

  BannerAd getBanner() => BannerAd(
        adUnitId: _adId!,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) => _onAdLoaded!(ad),
          onAdFailedToLoad: (ad, error) => _onAdFailedToLoad!(ad, error),
        ),
      );
}
