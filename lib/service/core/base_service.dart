import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/service/utils/constants.dart';
import 'package:shop_app/service/utils/share_prefer_utils.dart';

class BaseServices {
  BaseServices(this.dio);
  Dio dio;

  Future<dynamic> createPost(String subUri, {bool showLoading = false, Map<String, dynamic>? body, BuildContext? context}) async {
    if (showLoading) {
      Fluttertoast.showToast(msg: "Đang xử lý");
    }
    try {
      final Response<dynamic> response = await dio.post(subUri, data: body ?? {});
      if (showLoading) {
        Navigator.pop(context!);
      }
      if (response.statusCode != null) {
        if(response.statusCode == StatusApi.STATUS_200
            || response.statusCode == StatusApi.STATUS_201) {
            return response.data;
        }
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: (e.response != null && e.response?.data != null && e.response?.data['message'] != null) ? e.response?.data['message'] : 'Đã có lỗi xảy ra trong quá trình xử lý');
      //SharePreferUtils.logOutApp();
      if (showLoading) {
        Navigator.pop(context!);
      }
      return;
    }
  }

  Future<dynamic> createGet(String subUri, {bool showLoading = false, Map<String, dynamic>? body, BuildContext? context}) async {
    if (showLoading) {
      Fluttertoast.showToast(msg: "Đang xử lý");
    }
    try {
      final Response<dynamic> response = await dio.get(subUri, queryParameters: body ?? {});
      if (showLoading) {
        Navigator.pop(context!);
      }
      if (response.statusCode != null) {
        if(response.statusCode == StatusApi.STATUS_200
            || response.statusCode == StatusApi.STATUS_201) {
          return response.data;
        }
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: (e.response != null && e.response?.data != null && e.response?.data['message'] != null) ? e.response?.data['message'] : 'Đã có lỗi xảy ra trong quá trình xử lý');
      SharePreferUtils.logOutApp();
      if (showLoading) {
        Navigator.pop(context!);
      }
      return;
    }
  }
}