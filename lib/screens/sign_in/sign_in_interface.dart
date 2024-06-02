import 'package:flutter/material.dart';
import '../../models/LoginRequest.dart';

abstract class ILoginInterface {
  Future<void> login(LoginRequest request, BuildContext context, String auth);
}
