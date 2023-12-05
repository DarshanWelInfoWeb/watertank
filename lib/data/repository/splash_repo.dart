import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';

class SplashRepo {
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences});

  void disableIntro() {
    sharedPreferences.setBool(AppConstants.INTRO, true);
  }

  bool showIntro() {
    print('${sharedPreferences.getBool(AppConstants.INTRO)!}');
    return sharedPreferences.getBool(AppConstants.INTRO)!;
  }

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.INTRO)) {
      sharedPreferences.setBool(AppConstants.INTRO, false);
    }
  }
}
