// ignore_for_file: constant_identifier_names

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_interstitial.dart';
import 'package:human_benchmark_flutter_v2/helpers/colorful_print.dart';

class AdManager {
  static String interstitialTestId = 'ca-app-pub-3940256099942544/1033173712';

  static InterstitialAd? sequenceMemoryInterstitial;
  static InterstitialAd? aimTrainerInterstitial;
  static InterstitialAd? blindNumbersInterstitial;
  static InterstitialAd? catchColorInterstitial;
  static InterstitialAd? coloredCellCountInterstitial;
  static InterstitialAd? coloredTextInterstitial;
  static InterstitialAd? countOneByOneInterstitial;
  static InterstitialAd? fallingBallsInterstitial;
  static InterstitialAd? fastFingersInterstitial;
  static InterstitialAd? findColorInterstitial;
  static InterstitialAd? findNumberInterstitial;
  static InterstitialAd? holdAndClickInterstitial;
  static InterstitialAd? mathInterstitial;
  static InterstitialAd? vibrationInterstitial;
  static InterstitialAd? visualMemoryInterstitial;

  static Future<void> loadAllInterstitialAds() async {
    await sequenceMemoryInterstital();
    await loadAimTrainerInterstitial();
    await loadBlindNumbersInterstitial();
    await loadCatchColorInterstitial();
    await loadColoredCellCountInterstitial();
    await loadColoredTextInterstitial();
    await loadCountOneByOneInterstitial();
    await loadFallingBallsInterstitial();
    await loadFastFingersInterstitial();
    await loadFindColorInterstitial();
    await loadFindNumberInterstitial();
    await loadHoldAndClickInterstitial();
    await loadMathInterstitial();
    await loadVibrationInterstitial();
    await loadVisualMemoryInterstitial();
    addCallbacks();
  }

  static Future<void> sequenceMemoryInterstital() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        sequenceMemoryInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadAimTrainerInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        aimTrainerInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadBlindNumbersInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        blindNumbersInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadCatchColorInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        catchColorInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadColoredCellCountInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        coloredCellCountInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadColoredTextInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        coloredTextInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadCountOneByOneInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        countOneByOneInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadFallingBallsInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        fallingBallsInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadFastFingersInterstitial() async {
    AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        fastFingersInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadFindColorInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        findColorInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadFindNumberInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        findNumberInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadHoldAndClickInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        holdAndClickInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadMathInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        mathInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadVibrationInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        vibrationInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadVisualMemoryInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        visualMemoryInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static void addCallbacks() {
    sequenceMemoryInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadAimTrainerInterstitial();
      },
    );
    aimTrainerInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadAimTrainerInterstitial();
      },
    );
    blindNumbersInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadBlindNumbersInterstitial();
      },
    );
    catchColorInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadCatchColorInterstitial();
      },
    );
    coloredCellCountInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadColoredCellCountInterstitial();
      },
    );
    countOneByOneInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadCountOneByOneInterstitial();
      },
    );
    fallingBallsInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadFallingBallsInterstitial();
      },
    );
    fastFingersInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadFastFingersInterstitial();
      },
    );
    findColorInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadFindColorInterstitial();
      },
    );
    findNumberInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadFindNumberInterstitial();
      },
    );
    holdAndClickInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadHoldAndClickInterstitial();
      },
    );
    mathInterstitial?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadMathInterstitial();
      },
    );
    vibrationInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadVibrationInterstitial();
      },
    );
    visualMemoryInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadVisualMemoryInterstitial();
      },
    );
  }

  static void showAimTrainerAd() => aimTrainerInterstitial?.show();
  static void showBlindNumbersAd() => blindNumbersInterstitial?.show();
  static void showCatchColorAd() => catchColorInterstitial?.show();
  static void showColoredCellCountAd() => coloredCellCountInterstitial?.show();
  static void showColoredTextAd() => coloredTextInterstitial?.show();
  static void showCountOneByOneAd() => countOneByOneInterstitial?.show();
  static void showFallingBallsAd() => fallingBallsInterstitial?.show();
  static void showFastFingersAd() => fastFingersInterstitial?.show();
  static void showFindColorAd() => findColorInterstitial?.show();
  static void showFindNumberAd() => findNumberInterstitial?.show();
  static void showHoldAndClickAd() => holdAndClickInterstitial?.show();
  static void showMathAd() => mathInterstitial?.show();
  static void showVibrationAd() => vibrationInterstitial?.show();
  static void showVisualMemoryAd() => visualMemoryInterstitial?.show();
  static void showSequenceMemoryAd() => sequenceMemoryInterstitial?.show();

  static void _printSuccess(String name) =>
      ColorfulPrint.green('$name Interstitial ad loaded.');

  static void _printError(String name) =>
      ColorfulPrint.red('$name Interstitial ad load error.');
}
