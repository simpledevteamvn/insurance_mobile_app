import '../../language_vn.dart';
import 'package:flutter/material.dart';

class LanguageUtils {
  static LanguageProperties? _instance;

  // factory LanguageUtils() {
  //   assert(_instance != null, '\nEnsure to initialize ScreenUtil before accessing it.\nPlease execute the init method : ScreenUtil.init()');
  //   return _instance;
  // }

  BuildContext? context;

  // static init(BuildContext ctx) {
  //   _instance ??= LanguageUtils._instance;
  //   _instance..context = ctx;
  // }

  /// Đa ngôn ngữ không cần truyền context, Có thể dùng được mọi nơi
  String? languageCustom(String translate) {
    if (translate.isNotEmpty || translate != null) {
      return LanguageProperties.of(context!)?.translate(translate);
    } else {
      return 'key isEmtype';
    }
  }
}
