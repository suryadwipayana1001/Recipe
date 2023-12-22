import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipeai/core/presentation/providers/result_state.dart';
import '../../../features/result_recipe/domain/usecase/result_usecase.dart';
import '../../core.dart';

class CoreProvider with ChangeNotifier {
  final ResultQuestation resultQuestation;
  CoreProvider({required this.resultQuestation});

  String? _result;
  // RewardedAd? _rewardedAd;
  // RewardedAd? _rewardAd;
  String? _language = "en";
  TextEditingController _ingredientsController = TextEditingController();
  int _headerSlider = 1;
  ResultState? _state;
  bool _ingredientsError = false;
  final _formKey = GlobalKey<FormState>();

  set setLanguage(val) {
    _language = val;
    notifyListeners();
  }

  // set setRewardedAd(val) {
  //   _rewardedAd = val;
  //   notifyListeners();
  // }

  // set setRewardAd(val) {
  //   _rewardAd = val;
  //   notifyListeners();
  // }

  set setHeaderSlider(val) {
    _headerSlider = val;
    notifyListeners();
  }

  set setState(val) {
    _state = val;
    notifyListeners();
  }

  set setIngredientsError(bool val) {
    _ingredientsError = val;
    notifyListeners();
  }

  // void initializeRewardAd() {
  //   RewardedAd.load(
  //     adUnitId: AdHelper.rewardedAdUnitId,
  //     request: const AdRequest(),
  //     rewardedAdLoadCallback: RewardedAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         setRewardAd = ad;
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (RewardedAd ad) {
  //             ad.dispose();
  //             setRewardedAd = null;
  //             initializeRewardAd();
  //           },
  //           onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //             ad.dispose();
  //             initializeRewardAd();
  //           },
  //         );
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         printWarning('RewardedAd failed to load: $error');
  //       },
  //     ),
  //   );
  // }

  Stream<ResultState> fetch() async* {
    yield ResultLoading();
    _state = ResultLoading();
    final data = {
      "bahan": ingredientsController.text,
      "lang": locator<Session>().isLang,
    };
    printWarning(ingredientsController.text);
    printWarning(locator<Session>().isLang);
    final res = await resultQuestation.call(data);
    yield* res.fold((error) async* {
      yield ResultFailure(error: error);
      _state = ResultFailure(error: error);
    }, (res) async* {
      _result = res.data;
      yield ResultSuccess();
      _state = ResultSuccess();
    });
  }

  // RewardedAd? get rewardedAd => _rewardedAd;
  // RewardedAd? get rewardAd => _rewardAd;
  String? get language => _language;
  TextEditingController get ingredientsController => _ingredientsController;
  int get headerSlider => _headerSlider;
  String? get result => _result;
  ResultState? get resultState => _state;
  bool get ingredientsError => _ingredientsError;
  GlobalKey<FormState> get formKey => _formKey;
}
