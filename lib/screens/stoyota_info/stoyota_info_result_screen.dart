import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/stoyota_info/components/body.dart';

class ToyotaInfoResultScreen extends StatelessWidget {

  static String routeName = "/resultToyotaInfo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Thông tin chi tiết".toUpperCase())),
        body: ToyotaInfoResult(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.stoyota_info_search)
    );
  }
}
