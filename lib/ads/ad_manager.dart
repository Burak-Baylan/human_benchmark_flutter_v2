// ignore_for_file: constant_identifier_names

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/ads/ad_interstitial.dart';
import 'package:human_benchmark_flutter_v2/helpers/colorful_print.dart';

class AdManager {
  static String interstitialTestId = 'ca-app-pub-3940256099942544/1033173712';

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

  static Future<void> loadAimTrainerInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        aimTrainerInterstitial = ad;
        _printSuccess('Aim Trainer');
      },
      onAdFailedToLoad: (error) {
        _printError('Aim Trainer');
      },
    );
  }

  static Future<void> loadBlindNumbersInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        blindNumbersInterstitial = ad;
        _printSuccess('Aim Trainer');
      },
      onAdFailedToLoad: (error) {
        _printError('Aim Trainer');
      },
    );
  }

  static Future<void> loadCatchColorInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        catchColorInterstitial = ad;
        _printSuccess('Catch Color');
      },
      onAdFailedToLoad: (error) {
        _printError('Catch Color');
      },
    );
  }

  static Future<void> loadColoredCellCountInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        coloredCellCountInterstitial = ad;
        _printSuccess('Color Cell Count');
      },
      onAdFailedToLoad: (error) {
        _printError('Color Cell Count');
      },
    );
  }

  static Future<void> loadColoredTextInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        coloredTextInterstitial = ad;
        _printSuccess('Colored Text');
      },
      onAdFailedToLoad: (error) {
        _printError('Colored Text');
      },
    );
  }

  static Future<void> loadCountOneByOneInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        countOneByOneInterstitial = ad;
        _printSuccess('Count One By One');
      },
      onAdFailedToLoad: (error) {
        _printError('Count One By One');
      },
    );
  }

  static Future<void> loadFallingBallsInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        fallingBallsInterstitial = ad;
        _printSuccess('Falling Balls');
      },
      onAdFailedToLoad: (error) {
        _printError('Falling Balls');
      },
    );
  }

  static Future<void> loadFastFingersInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        fastFingersInterstitial = ad;
        _printSuccess('Fast Fingers');
      },
      onAdFailedToLoad: (error) {
        _printError('Fast Fingers');
      },
    );
  }

  static Future<void> loadFindColorInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        findColorInterstitial = ad;
        _printSuccess('Find Color');
      },
      onAdFailedToLoad: (error) {
        _printError('Find Color');
      },
    );
  }

  static Future<void> loadFindNumberInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        findNumberInterstitial = ad;
        _printSuccess('Find Number');
      },
      onAdFailedToLoad: (error) {
        _printError('Find Number');
      },
    );
  }

  static Future<void> loadHoldAndClickInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        holdAndClickInterstitial = ad;
        _printSuccess('Hold And Click');
      },
      onAdFailedToLoad: (error) {
        _printError('Hold And Click');
      },
    );
  }

  static Future<void> loadMathInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        mathInterstitial = ad;
        _printSuccess('Math');
      },
      onAdFailedToLoad: (error) {
        _printError('Math');
      },
    );
  }

  static Future<void> loadVibrationInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        vibrationInterstitial = ad;
        _printSuccess('Vibration');
      },
      onAdFailedToLoad: (error) {
        _printError('Vibration');
      },
    );
  }

  static Future<void> loadVisualMemoryInterstitial() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        visualMemoryInterstitial = ad;
        _printSuccess('Visual Memory');
      },
      onAdFailedToLoad: (error) {
        _printError('Visual Memory');
      },
    );
  }

  static void addCallbacks() {
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
  static void showVisualMemoryrAd() => visualMemoryInterstitial?.show();

  static void _printSuccess(String name) =>
      ColorfulPrint.green('$name Interstitial ad loaded.');

  static void _printError(String name) =>
      ColorfulPrint.red('$name Interstitial ad load error.');
}