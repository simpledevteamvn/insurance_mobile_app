import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/models/LoginRequest.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_service.dart';
import 'package:shop_app/service/utils/constants.dart';
import 'package:shop_app/service/utils/global_utils.dart';

import '../../../components/default_button.dart';
import '../../../style.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String invalidUsernameEmpty = "Tài khoản không được để trống";
  String invalidPasswordEmpty = "Mật khẩu không được để trống";

  String username = "";
  String password = "";
  String accessToken = "";
  bool remember = false;
  bool isShowPassword = true;
  final List<String?> errors = [];
  dynamic data;
  final loginService = LoginService();


  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  setData() {
    data = LoginRequest(
      requestId: GlobalUtils.getCurrentTimeStringRequest(),
      username: username.toString().trim(),
      password: password.toString().trim(),
      lang: Constants.LANGUAGE,
      operatingSystem: Constants.PLATFORM,
      accessToken: accessToken
    );
  }

  void _login() async {
    setData();
    await loginService.login(data, context, Constants.N);
  }

  void _loginEnter() async {
    setData();
    await loginService.login(data, context, Constants.N);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Nhớ mật khẩu"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text("Quên mật khẩu",
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Đăng nhập",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                _login();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: invalidPasswordEmpty);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: invalidPasswordEmpty);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu",
        hintText: "",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(color: kPrimaryColor),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: invalidUsernameEmpty);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: invalidUsernameEmpty);
          return "";
        }
        return null;
      }, decoration: InputDecoration(
        labelText: "Tài khoản",
        hintText: "",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(color: kPrimaryColor),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user.svg"),
      ),
    );
  }
}
