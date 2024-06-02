import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';

import 'components/search_body.dart';


class QuotationSearchScreen extends StatelessWidget {
  static String routeName = "/searchContract";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tra cứu hợp đồng".toUpperCase()),
      ),
      body: SearchForm(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.quotation_search)
    );
  }
}