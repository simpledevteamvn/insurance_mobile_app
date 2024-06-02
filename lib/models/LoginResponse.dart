import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  late String username;
  late String email;
  late String telephone;
  late String address;
  late String fullname;
  late String officecode;
  late String officename;
  late String avatar;
  late String accessToken;
  late String tokenType = "Bearer";
  late String mapRuleData;
  late String mapRuleAction;
  late String errorCode;
  late String errorDesc;
  late String deviceId;

  LoginResponse({required this.accessToken, required this.username,
    required this.fullname, required this.avatar, required this.officecode,
    required this.officename, required this.errorCode, required this.errorDesc});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['accessToken']??"",
        username: json['username']??"",
        fullname: json['fullname']??"",
        avatar: json['avatar']??"",
        officecode: json['officecode']??"",
        officename: json['officename']??"",
        errorCode: json['errorCode']??"",
        errorDesc: json['errorDesc']??""
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'username': username,
      'fullname': fullname,
      'avatar': avatar,
      'officecode': officecode,
      'officename': officename,
      'errorCode' : errorCode,
      'errorDesc': errorDesc
    };
  }
}