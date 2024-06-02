import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

const kPrimaryColor = Color(0xFFA51739);
const kPrimaryColorMain = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kPrimaryDarkColor = Color(0xFF1E2F41);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF5e5e5e);
const kTextColorBorder = Color(0xFFAAAAAA);
const kAnimationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(fontSize: getProportionateScreenWidth(28), fontWeight: FontWeight.bold, color: Colors.black, height: 1.5);
const defaultDuration = Duration(milliseconds: 250);
// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Tài khoản không được để trống";
const String kInvalidEmailError = "Tài khoản không đúng";
const String kPassNullError = "Mật khẩu không được để trống";
const String kShortPassError = "Độ mạnh mật khẩu yếu";
const String kMatchPassError = "Mật khẩu không đúng";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

InputDecoration kInputDecoration(String title) {
  return InputDecoration(
      labelText: title,
      hintText: "",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(color: kPrimaryColor),
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kTextColorBorder)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kTextColorBorder)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: kTextColorBorder)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kTextColorBorder))
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
      borderSide: BorderSide(color: kTextColorBorder),
  );
}
