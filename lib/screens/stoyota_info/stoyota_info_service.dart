import 'package:flutter/material.dart';
import 'package:shop_app/models/ToyotaInfoRequest.dart';
import 'package:shop_app/screens/stoyota_info/stoyota_info_interface.dart';
import 'package:shop_app/service/core/base_api.dart';
import 'package:shop_app/service/utils/constants.dart';

class ToyotaInfoService implements ToyotaInfoInterface {

  @override
  Future<dynamic> searchToyotaInfo(ToyotaInfoRequest request, BuildContext context) async {
    return await BaseApi.getInstance()?.createPost(UrlApi.API_SEARCH_INFO, showLoading: true, body: request.toMap(), context: context);
  }
}