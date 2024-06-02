import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/LoginResponse.dart';
import 'constants.dart';

class SharePreferUtils {
  static Future<String?> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.ACCESS_TOKEN);
  }

  static Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.ACCESS_TOKEN, accessToken);
  }

  static Future<void> saveStateRememberPass(bool isRememberPass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.REMEMBERPASS, isRememberPass.toString());
  }

  static Future<bool> getStateRememberPass() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String remember = pref.getString(Constants.REMEMBERPASS) ?? "false";
    return remember == "true";
  }

  // start theme app
  static Future<void> saveTheme(String themeName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.THEME, themeName);
  }

  static Future<String?> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.THEME);
  }
  // end theme app

  static Future<String?> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? username = pref.getString(Constants.USERNAME);
    return username;
  }

  static Future<void> saveUsername(String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.USERNAME, username);
  }

  static Future<void> removeUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(Constants.USERNAME);
  }

  static Future<String?> getPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? password = pref.getString(Constants.PASSWORD);
    return password;
  }

  static Future<void> savePassword({required String password}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.PASSWORD, password);
  }

  static Future<void> saveFCMToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token" + Constants.TOKEN, token). then((value) => print("token_push 1= $value") );
    return;
  }

  static Future<String> getFCMToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String fcmToken = pref.getString("token" + Constants.TOKEN) ?? "";
    print("token_push 2= $fcmToken");
    return fcmToken;
  }

  static Future<void> saveUserInfo(Map userInfo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    await pref.setString(Constants.USER_INFO, user);
  }

  static Future<LoginResponse?> getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString(Constants.USER_INFO);
    print(data);
    if (data != null) {
      var userMap = jsonDecode(data);
      final userInfo = LoginResponse.fromJson(userMap);
      return userInfo;
    }
    return null;
  }

  static Future<void> saveUserInfoFinger(Map userInfo, String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    await pref.setString(userName, user);
  }

  static Future<void> saveUserWithQuickMenu(
      List<Map> quickMenu, String username) async {
    SharedPreferences preferUtils = await SharedPreferences.getInstance();
    await preferUtils.setString(username + "quickMenu", json.encode(quickMenu));
  }

  static Future<List<dynamic>> getUserWithQuickMenu(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? data = preferences.getString(username + "quickMenu");
    List<dynamic> quickMenu = [];
    if (data != null) {
      quickMenu = json.decode(data);
    }

    return quickMenu;
  }

  static Future<LoginResponse?> getUserInfoFinger(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString(userName);
    if (data != null) {
      var userMap = jsonDecode(data);
      var userInfo = LoginResponse.fromJson(userMap);
      return userInfo;
    }
    return null;
  }

  static Future<String?> getAvatar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? avatar = pref.getString(Constants.Avatar);
    return avatar;
  }

  static Future<void> saveAvatar(String avatar) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.Avatar, avatar);
  }

  static Future<void> removeCachedWhenLogOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.emailKey);
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
    await preferences.setString(Constants.REMEMBERPASS, "false");
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.USER_INFO);
    await preferences.remove(Constants.TOKEN);
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.PASSWORD);
    await preferences.remove(Constants.Avatar);
  }

  static Future<void> saveSerialNo(String serialNo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.SERIAL_NO, serialNo);
  }

  static Future<String?> getSerialNo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? data = pref.getString(Constants.SERIAL_NO);
    if (data != null) {
      return data;
    }
    return null;
  }

  static logOutApp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
    await preferences.remove(Constants.KEY);
  }

  static logOutAppRemoveToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(Constants.emailKey);
    await preferences.remove(Constants.ACCESS_TOKEN);
    await preferences.remove(Constants.USER_INFO);
    await preferences.setString(Constants.REMEMBERPASS, "false");
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.USER_INFO);
    await preferences.remove(Constants.TOKEN);
    await preferences.remove(Constants.LISTITEMHOMEPAGE);
    await preferences.remove(Constants.PASSWORD);
    await preferences.remove(Constants.USERNAME);
    await preferences.remove(Constants.Avatar);
  }
}
