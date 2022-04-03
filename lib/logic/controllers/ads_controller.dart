

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../base_one/view/game.dart';
import '../../hellper/adsManager.dart';

class HomeControllerPage extends GetxController{
  late RewardedAd rewardedAd ;
  bool isRewardedAdReady = false ;
  var credit = 0 ;
 bool y = false ;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializationStatus();
    loadRewardedAd() ;
    update() ;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  int count = 1 ;
  void decrement(){

    if(count <= 0){
      return ;
    }
    count -- ;

    update() ;
  }


  Future<InitializationStatus> initializationStatus(){
    return MobileAds.instance.initialize() ;
  }

  void loadRewardedAd(){
    RewardedAd.load(
      adUnitId: AdsManager.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad){
            rewardedAd = ad ;
           update() ;
            ad.fullScreenContentCallback =  FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad){
                   isRewardedAdReady = false;
                  loadRewardedAd();
                  update() ;
                }
            ) ;

              isRewardedAdReady = true ;
              update() ;
          } ,
          onAdFailedToLoad: (error){
            print('67777777777777777777777 $error') ;
          }) ,
    ) ;
  }

  showRewardedAd(){
    rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem item){
      print('$item ;;;;;;;;;;;;;;;;') ;
      credit +=item.amount.toInt() ;
      update() ;
    }) ;
  }

}