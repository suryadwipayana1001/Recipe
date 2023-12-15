import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../core.dart';
import '../../domain/entities/dropdown_option_entities.dart';

class CoreProvider with ChangeNotifier {
  String? _result;
  RewardedAd? _rewardedAd;
  RewardedAd? _rewardAd;
  String? _language = "en";
  TextEditingController _ingredientsController = TextEditingController();
  int _headerSlider = 1;

  set setLanguage(val) {
    _language = val;
    notifyListeners();
  }

  set setRewardedAd(val) {
    _rewardedAd = val;
    notifyListeners();
  }

  set setRewardAd(val) {
    _rewardAd = val;
    notifyListeners();
  }

  set setHeaderSlider(val) {
    _headerSlider = val;
    notifyListeners();
  }

  void initializeRewardAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setRewardAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedAd ad) {
              ad.dispose();
              setRewardedAd = null;
              initializeRewardAd();
            },
            onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
              ad.dispose();
              initializeRewardAd();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          printWarning('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  RewardedAd? get rewardedAd => _rewardedAd;
  RewardedAd? get rewardAd => _rewardAd;
  String? get language => _language;
  TextEditingController get ingredientsController => _ingredientsController;
  int get headerSlider => _headerSlider;
}
