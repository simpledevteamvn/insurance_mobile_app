import 'dart:convert';
import 'package:shop_app/service/utils/constants.dart';

class LoginRequest {
  late String requestId;
  late String username;
  late String password;
  late String lang;
  late String version;
  late String isFingerLogin;
  late String isNotification;
  late String operatingSystem;
  late String accessToken;
  late String deviceId;

  LoginRequest({required this.requestId, required this.username, required this.password,
    required this.lang, required this.operatingSystem, required this.accessToken}) {
    this.lang = Constants.LANGUAGE;
    this.version = Constants.VERSION_APP;}

  String get getRequestId => requestId;

  set setRequestId(String requestId) => this.requestId = requestId;

  String get getUserName => username;

  set setUsername(String username) => this.username = username;

  String get getPassWord => password;

  set setPassWord(String password) => this.password = password;

  String get getLang => lang;

  set setLang(String lang) => this.lang = lang;

  String get getVersion => version;

  set setVersion(String version) => this.version = version;

  String get getIsFingerLogin => isFingerLogin;

  set setIsFingerLogin(String value) => isFingerLogin = value;

  String get getIsNotification => isNotification;

  set setIsNotification(String isNotification) =>
      this.isNotification = isNotification;

  String get getOperatingSystem => operatingSystem;

  set setOperatingSystem(String operatingSystem) => this.operatingSystem = operatingSystem;

  String get getAccessToken => accessToken;

  set setAccessToken(String accessToken) => this.accessToken = accessToken;

  String get getDeviceId => deviceId;

  set setDeviceId(String deviceId) => this.deviceId = deviceId;

  Map<String, dynamic> toMap() {
    return {
      'requestId': requestId,
      'username': username,
      'password': password,
      'version': version,
      'operatingSystem': operatingSystem
    };
  }

  Map<String, dynamic> toMapFinger() {
    return {
      'requestId': requestId,
      'username': username,
      'password': password,
      'version': version,
      'isFingerLogin': isFingerLogin
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      requestId: map['requestId']??"",
      username: map['username']??"",
      password: map['password']??"",
      lang: map['lang']??"",
      operatingSystem: map['operatingSystem']??"",
      accessToken: map['accessToken']??""
    );
  }

  String toJson() => json.encode(toMap());
  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source));
}