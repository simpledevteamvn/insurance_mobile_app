import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_app/service/core/base_service.dart';
import 'package:shop_app/service/utils/share_prefer_utils.dart';
import 'package:shop_app/service/utils/constants.dart';

class BaseApi {
  static BaseApi? instance;
  static BaseServices? baseService;

  BaseApi() {
    var options = BaseOptions(
      baseUrl: Constants.URL_API,
      connectTimeout: new Duration(milliseconds: Constants.TIME_OUT),
      receiveTimeout: new Duration(milliseconds: Constants.TIME_OUT)
    );
    Dio dio = Dio(options);
    dio..interceptors.add(AuthInterceptor()); // add token
    dio..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    baseService = BaseServices(dio);
  }

  static BaseServices? getInstance() {
    instance ??= BaseApi();
    return _getBaseService();
  }

  static BaseServices? _getBaseService() {
    return baseService;
  }

  static Future<dynamic> loadAsset(String linkFile) async {
    return jsonDecode(await rootBundle.loadString(linkFile));
  }
}

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, String> headers = new Map();
    headers['content-type'] = 'application/json; charset=utf-8';
    headers['accept'] = 'application/json';
    await SharePreferUtils.getAccessToken().then((String? accessToken) async => {
      if (accessToken != null){
          await SharePreferUtils.getUserInfo().then((value) => {
            headers['Authorization'] = 'Bearer $accessToken'
          })
        }
    });
    options.headers = headers;
    print(headers);
    return super.onRequest(options, handler);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${DateTime.now().weekday}.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}