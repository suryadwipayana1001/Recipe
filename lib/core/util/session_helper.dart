import 'package:shared_preferences/shared_preferences.dart';
import '../core.dart';

abstract class Session {
  set setIndexLanguage(int index);
  set setLanguage(String lang);
  set setLanding(bool landing);

  int get isIndex;
  String get isToken;
  String get isLang;
  bool get isLanding;
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});
  @override
  set setIndexLanguage(int index) {
    pref.setInt(IS_INDEX, index);
  }

  set setToken(String token) {
    pref.setString(SESSION_TOKEN, token);
  }

  @override
  set setLanguage(String lang) {
    pref.setString(IS_LANG, lang);
  }

  @override
  set setLanding(bool value) {
    pref.setBool(IS_LANDING, value);
  }

  @override
  int get isIndex => pref.getInt(IS_INDEX) ?? 0;
  @override
  String get isToken => pref.getString(SESSION_TOKEN) ?? '';
  String get isLang => pref.getString(IS_LANG) ?? 'en';
  bool get isLanding => pref.getBool(IS_LANDING) ?? false;
}
