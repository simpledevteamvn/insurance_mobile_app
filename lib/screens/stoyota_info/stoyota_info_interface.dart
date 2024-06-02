import 'package:flutter/material.dart';
import 'package:shop_app/models/ToyotaInfoRequest.dart';

abstract class ToyotaInfoInterface {
  Future<dynamic> searchToyotaInfo(ToyotaInfoRequest request, BuildContext context);
}