import 'package:flutter/material.dart';
import '../../models/ContractRequest.dart';

abstract class IQuotationInterface {
  Future<dynamic> searchContract(ContractRequest request, BuildContext context);
}