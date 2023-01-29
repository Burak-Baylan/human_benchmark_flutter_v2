import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark_flutter_v2/core/hive/hive_manager.dart';
import '../helpers/colorful_print.dart';
import '../main.dart';
import 'ad_interstitial.dart';

class AdManager {
  static String interstitialTestId = 'ca-app-pub-3940256099942544/1033173712';

  static InterstitialAd? reactionTimeInterstitial;
  static InterstitialAd? numbersMemoryInterstitial;
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
  static RewardedInterstitialAd? rewardedInterstitialAd;

  static Future<void> loadAllInterstitialAds() async {
    if (mainVm.isPremium) return;
    await loadRewardedInterstitialAd();
    await loadReactionTimeInterstital();
    await loadNumbersMemoryInterstital();
    await loadSequenceMemoryInterstital();
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

  static Future<void> loadNumbersMemoryInterstital() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        numbersMemoryInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadReactionTimeInterstital() async {
    await AdInterstitial.load(
      adUnitId: interstitialTestId,
      onAdLoaded: (ad) {
        reactionTimeInterstitial = ad;
      },
      onAdFailedToLoad: (error) {},
    );
  }

  static Future<void> loadSequenceMemoryInterstital() async {
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

  static Future<void> loadRewardedInterstitialAd() async {
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5354046379',
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          print('Rewarded Interstital $ad loaded.');
          rewardedInterstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedInterstitialAd failed to load: $error');
        },
      ),
    );
  }

  static void addCallbacks() {
    reactionTimeInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadReactionTimeInterstital();
      },
    );
    numbersMemoryInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadNumbersMemoryInterstital();
      },
    );
    sequenceMemoryInterstitial?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        loadSequenceMemoryInterstital();
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

  static void showReactionTimeAd() => showAd(reactionTimeInterstitial);
  static void showNumbersMemoryeAd() => showAd(numbersMemoryInterstitial);
  static void showAimTrainerAd() => showAd(aimTrainerInterstitial);
  static void showBlindNumbersAd() => showAd(blindNumbersInterstitial);
  static void showCatchColorAd() => showAd(catchColorInterstitial);
  static void showColoredCellCountAd() => showAd(coloredCellCountInterstitial);
  static void showColoredTextAd() => showAd(coloredTextInterstitial);
  static void showCountOneByOneAd() => showAd(countOneByOneInterstitial);
  static void showFallingBallsAd() => showAd(fallingBallsInterstitial);
  static void showFastFingersAd() => showAd(fastFingersInterstitial);
  static void showFindColorAd() => showAd(findColorInterstitial);
  static void showFindNumberAd() => showAd(findNumberInterstitial);
  static void showHoldAndClickAd() => showAd(holdAndClickInterstitial);
  static void showMathAd() => showAd(mathInterstitial);
  static void showVibrationAd() => showAd(vibrationInterstitial);
  static void showVisualMemoryAd() => showAd(visualMemoryInterstitial);
  static void showSequenceMemoryAd() => showAd(sequenceMemoryInterstitial);
  static void showRewardedInterstitialAd(int addIndex) =>
      rewardedInterstitialAd?.show(
        onUserEarnedReward: (ad, reward) {
          mainVm.addToUnlockedGames(addIndex);
          HiveManager.setUnlockedGames(mainVm.unlockedGames);
        },
      );
  static void showAd(InterstitialAd? ad) {
    if (mainVm.isPremium) return;
    try {
      ColorfulPrint.green('SHOWING');
      ad?.show();
    } catch (e) {
      ColorfulPrint.red('CANT SHOW');
      ad?.dispose();
    }
  }
}
