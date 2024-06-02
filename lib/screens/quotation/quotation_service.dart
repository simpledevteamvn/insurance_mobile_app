import 'package:flutter/material.dart';
import 'package:shop_app/models/ContractRequest.dart';
import 'package:shop_app/screens/quotation/quotation_interface.dart';
import 'package:shop_app/service/core/base_api.dart';
import 'package:shop_app/service/utils/constants.dart';

class QuotationService implements IQuotationInterface {

  @override
  Future<dynamic> searchContract(ContractRequest request, BuildContext context) async {
    return await BaseApi.getInstance()?.createPost(UrlApi.API_SEARCH_CONTRACT, showLoading: true, body: request.toMap(), context: context);
  }
}
