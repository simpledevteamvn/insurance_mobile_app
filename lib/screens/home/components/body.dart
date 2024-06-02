import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenWidth(10)),
                HomeHeader(),
                SizedBox(height: getProportionateScreenWidth(10)),
                SpecialOffers(),
                Categories(menuType: "1", menuTitle : "Báo giá"),
                SizedBox(height: getProportionateScreenWidth(10)),
                DiscountBanner(),
                Categories(menuType: "2", menuTitle : "Báo cáo"),
                SizedBox(height: getProportionateScreenWidth(10)),
                PopularProducts(),
                SizedBox(height: getProportionateScreenWidth(10)),
              ],
            ),
          ),
       )
    );
  }
}
