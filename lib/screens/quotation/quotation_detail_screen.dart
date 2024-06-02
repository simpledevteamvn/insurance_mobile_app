import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/quotation/components/detail_body.dart';


class QuotationDetailScreen extends StatelessWidget {
  static String routeName = "/detailContract";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chi tiết hợp đồng".toUpperCase()),
        ),
        body: DetailBody(),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.quotation_search));
  }
}
