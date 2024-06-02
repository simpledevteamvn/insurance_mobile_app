import 'dart:convert';
import 'dart:math';
import 'dart:io' show Platform;
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:intl/intl.dart';

class GlobalUtils {

  static String hmacHashInBase64FromString(String key, String data){
    final keyBytes = utf8.encode(key);
    final bytes = utf8.encode(data);
    var hmacSha256 = new Hmac(sha256, keyBytes);
    Digest sha256Result = hmacSha256.convert(bytes);
    return sha256Result.toString();
  }

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String generateSHA256Pwd(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }

  static String urlEncode(String text) {
    String output = text;
    var detectHash = text.contains('#');
    var detectAnd = text.contains('&');
    var detectSlash = text.contains('/');
    var detectTrim = text.contains(' ');

    if (detectHash == true) {
      output = output.replaceAll('#', '%23');
    }
    if (detectAnd == true) {
      output = output.replaceAll('&', '%26');
    }
    if (detectSlash == true) {
      output = output.replaceAll('/', '%2f');
    }
    if (detectTrim == true) {
      output = output.replaceAll(' ', '');
    }
    return output;
  }

  static String getCurrentTimeStringRequest() {
    final DateTime nowDate = DateTime.now();
    return nowDate.year.toString() +
        format2Digit(nowDate.month) +
        format2Digit(nowDate.day) +
        format2Digit(nowDate.hour) +
        format2Digit(nowDate.minute) +
        format2Digit(nowDate.second);
  }

  /// sample: 2 => 02 */
  static String format2Digit(int n) {
    if (n < 10) {
      return '0' + n.toString();
    } else {
      return n.toString();
    }
  }

  static String getCurrentTimeConvertString(nowDate) {
    // final DateTime nowDate = DateTime.now();
    return nowDate.year.toString() +
        format2Digit(nowDate.month) +
        format2Digit(nowDate.day) +
        format2Digit(nowDate.hour) +
        format2Digit(nowDate.minute) +
        format2Digit(nowDate.second);
  }

  static String sha256Convert(String value) {
    return sha256.convert(utf8.encode(value)).toString();
  }

  static String enCry(String userName, String pass) {
    var start = userName.substring(5, 6);
    var end = userName.substring(userName.length - 1);
    if (start == end && (end == 0 || end == '0')) {
      start = 5.toString();
      end = 8.toString();
    }
    return randomString(int.parse(end)) + pass + randomString(int.parse(start));
  }

  static String randomString(int numbers) {
    String text = "";
    const String possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    for (var i = 0; i < numbers; i++) {
      text += charAt(possible, (Random().nextDouble() * possible.length).round());
    }
    return text;
  }

  static String charAt(String subject, int position) {
    if (subject.length <= position ||
        subject.length + position < 0) {
      return '';
    }
    final int _realPosition =
    position < 0 ? subject.length + position : position;
    return subject[_realPosition];
  }

  static dynamic convertStringToJson(String data) {
    return jsonDecode(data);
  }

  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static String trimText(String text) {
    String textStr;
    textStr = text.trim();
    return textStr;
  }

  static formatText(data) {
    var str = data;
    str = str.replaceAll(RegExp(r"(\à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)"), 'a');
    str = str.replaceAll(RegExp(r"(\À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)"), 'A');
    str = str.replaceAll(RegExp(r"(\è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)"), 'e');
    str = str.replaceAll(RegExp(r"(\ì|í|ị|ỉ|ĩ)"), 'i');
    str = str.replaceAll(RegExp(r"(\ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)"), 'o');
    str = str.replaceAll(RegExp(r"(\ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)"), 'u');
    str = str.replaceAll(RegExp(r"(\ỳ|ý|ỵ|ỷ|ỹ)"), 'y');
    str = str.replaceAll(RegExp(r"(\đ)"), 'd');
    str = str.replaceAll(RegExp(r"(\È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)"), 'E');
    str = str.replaceAll(RegExp(r"(\Ì|Í|Ị|Ỉ|Ĩ)"), 'I');
    str = str.replaceAll(RegExp(r"(\Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)"), 'O');
    str = str.replaceAll(RegExp(r"(\Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)"), 'U');
    str = str.replaceAll(RegExp(r"(\Ỳ|Ý|Ỵ|Ỷ|Ỹ)"), 'Y');
    str = str.replaceAll(RegExp(r"(\Đ)"), 'D');
    return str;
  }

  static String formatCurrency(String text) {
    if (text.length > 2) {
      var value = text;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return text.replaceAll(
        RegExp(r'\D'), ''); // nhập không phải là số thì xóa hết
  }

  static String formatCurrencyTonNumberString(String text) {
    return text.replaceAll(RegExp(r'\D'), '');
  }

  static String generateConvertDevice(String dataIn, signature) {
    var encodedKey = utf8.encode(signature); // signature=encryption key
    var hmacSha256 = new Hmac(sha256, encodedKey); // HMAC-SHA256 with key
    var bytesDataIn = utf8.encode(dataIn); // encode the data to Unicode.
    var digest = hmacSha256.convert(bytesDataIn); // encrypt target data
    String singedValue = digest.toString();
    return singedValue;
  }

  static bool isNumeric(String s) {
    if (s == '') {
      return false;
    }
    return double.parse(s) != null;
  }

  // format số tiền có chứa phần thập phân
  static formatDecimalCurrency(String valueStr, bool isAllowZero) {
    String val = valueStr;
    String firstVal;
    String secordVal;
    if (val.toString().indexOf('.') > 0) {
      firstVal =
          valueStr.substring(0, val.indexOf('.')).replaceAll('/\D/g', '');
      print(val.indexOf('.'));
      secordVal =
          val.substring(val.indexOf('.'), val.length).replaceAll('/\D/g', '');
      if (secordVal.length > 2) {
        secordVal = secordVal.substring(0, 4);
      }
      if (isAllowZero && secordVal.length == 2 && secordVal.contains('0')) {
        secordVal = '';
      }
      val = formatCurrency(firstVal) + secordVal;
    } else {
      val = formatCurrency(valueStr.toString().replaceAll('/\D/g', ''));
    }
    return val;
  }

  formatComma(String s) {
    String valueStr = s.toString().replaceAll('/\$|\,/g', '');
    if (!isNumeric(valueStr)) {
      return valueStr = "";
    }
    int number = int.parse(valueStr);
    number = (number * 100 + 0.50000000001).floor();
    number = (number / 100).floor();
    valueStr = number.toString();
    for (var i = 0; i < ((valueStr.length - (1 + i)).floor() / 3); i++)
      valueStr = valueStr.substring(0, valueStr.length - (4 * i + 3)) +
          ',' +
          valueStr.substring(valueStr.length - (4 * i + 3));
    return valueStr;
  }

  static bool isAfterByDay(DateTime start, DateTime end) {
    // so sánh năm
    if (start.year > end.year) {
      return true;
    }
    if (start.year < end.year) {
      return false;
    }
    // so sánh tháng
    if (start.month > end.month) {
      return true;
    }
    if (start.month < end.month) {
      return false;
    }
    // so sánh ngày
    if (start.day > end.day) {
      return true;
    }
    if (start.day < end.day) {
      return false;
    }
    return false;
  }

  static bool isSameByDay(DateTime start, DateTime end) {
    // so sánh năm
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return true;
    }
    return false;
  }

  static bool isNullOrEmpty(String input) {
    if(input.isEmpty){
      return true;
    }
    return false;
  }

  static DateTime convertStringToDate(String dateString, String format){
    DateTime date = DateFormat(format).parse(dateString);
    return date;
  }
}
