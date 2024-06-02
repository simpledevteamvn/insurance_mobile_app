import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/stoyota_info/components/search_body.dart';

class ToyotaInfoSearchScreen extends StatelessWidget {
  static String routeName = "/searchToyotaInfo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tra cứu thông tin".toUpperCase()),
      ),
      body: SearchForm(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.stoyota_info_search)
    );
  }
}