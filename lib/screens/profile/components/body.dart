import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/service/utils/share_prefer_utils.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {

  void _logout() async {
    await SharePreferUtils.logOutApp();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))]
            ),
            child:
                Column(
                  children: [
                      ProfileMenu(
                        text: "Thông tin tài khoản",
                        icon: "assets/icons/user.svg",
                        press: () => {},
                      ),
                      ProfileMenu(
                        text: "Thông báo",
                        icon: "assets/icons/bell.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Cài đặt",
                        icon: "assets/icons/setting.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Trợ giúp",
                        icon: "assets/icons/question.svg",
                        press: () {},
                      ),
                      ProfileMenu(
                        text: "Đăng xuất",
                        icon: "assets/icons/logout.svg",
                        press: () {_logout();Navigator.pushNamed(context, SignInScreen.routeName);},
                      )
                  ]
              )
          )
        ],
      ),
    );
  }
}
