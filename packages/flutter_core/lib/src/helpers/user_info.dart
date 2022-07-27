import 'dart:async';

import 'shared_pref_helper.dart';

class UserInfo {
  UserInfo._();
  static String tokenKey = 'userToken';

  static String? token;
  static bool firstCheckLogin = false;

  static final StreamController<bool> _onLogin = StreamController.broadcast();

  static Stream<bool> get onLogin => _onLogin.stream.distinct();

  static Future getTokenFromCached() async {
    final tempToken = await SharePrefHelper.instance.getValue(key: tokenKey);
    token = tempToken;
  }

  static bool isLoggedIn() {
    return (token ?? '').isNotEmpty;
  }

  static Future saveTokenInfo(String? nToken) async {
    await SharePrefHelper.instance.setValue(nToken, key: tokenKey);
    token = nToken;
  }

  static Future logout() async {
    await SharePrefHelper.instance.setValue(null, key: tokenKey);
    token = null;
    _onLogin.sink.add(false);
  }
}
