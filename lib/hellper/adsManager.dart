/*

import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  RewardedAd? _rewardedAd;


  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? "ca-app-pub-5668009313681390/7164698639"
            : "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback:
            RewardedAdLoadCallback(onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          _rewardedAd = null;
        }));
  }

  void addAds(bool rewardedAd) {
    if (rewardedAd) {
      loadRewardedAd();
    }
  }


  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedAd ad) {
        print("Ad onAdShowedFullScreenContent");
      }, onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
        loadRewardedAd();
        print('InterstitialAd failed to load: 4444444444444');
      }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        loadRewardedAd();
        print('InterstitialAd failed to load: 66666666666666');
      });

      _rewardedAd!.setImmersiveMode(true);
      _rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        print("${reward.amount} ${reward.type}");
      });
    }
  }

  void disposeAds() {
    _rewardedAd?.dispose();
  }
}


 */


import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class AdsManager{
  static bool testMode = true ;


  static String get rewardedAdUnitId {
    if (testMode == true) {
      return  'ca-app-pub-3940256099942544/5224354917' ;
      //RewardedAd.testAdUnitId ; //"ca-app-pub-3940256099942544/6300978111"; //test bannerAdUnitId
    } else if (Platform.isAndroid) {
      return "ca-app-pub-2852669237588604/9673938756";
    }
    else if (Platform.isIOS) {
      return "ca-app-pub-2852669237588604/7729413642";
    }
    else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}

