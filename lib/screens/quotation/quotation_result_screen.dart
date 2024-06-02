import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'components/body.dart';

class QuotationScreen extends StatelessWidget {

  static String routeName = "/quotation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Danh sách Hợp đồng".toUpperCase())),
      body: QuotaResult(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.quotation)
    );
  }
}
