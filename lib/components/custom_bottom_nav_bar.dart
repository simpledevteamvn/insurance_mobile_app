import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/quotation/quotation_search_screen.dart';
import 'package:shop_app/screens/stoyota_info/stoyota_info_search_screen.dart';

import '../style.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(offset: Offset(0, -5), blurRadius: 30, color: Color(0xFF444444).withOpacity(0.3))],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        )
      ),
      child: SafeArea(
          top: true,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.spaceAround,
            children: [
              Column(
                 children: [
                      IconButton(
                          alignment: Alignment.bottomCenter,
                          icon: SvgPicture.asset("assets/icons/home.svg", color: MenuState.home == selectedMenu ? kPrimaryColor : null, width: 20, height: 20, alignment: Alignment.center),
                          onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName)
                      ),
                      Text('Trang chủ', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
              ),
              Column(
                  children: [
                      IconButton(
                          alignment: Alignment.bottomCenter,
                          icon: SvgPicture.asset("assets/icons/statistic-user.svg", color: MenuState.quotation_search == selectedMenu ? kPrimaryColor : null, width: 20, height: 20, alignment: Alignment.center),
                          onPressed: () => Navigator.pushNamed(context, QuotationSearchScreen.routeName)
                      ),
                      Text('Tìm hợp đồng', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
              ),
              Column(
                  children: [
                    IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: SvgPicture.asset("assets/icons/search.svg", color: MenuState.stoyota_info_search == selectedMenu ? kPrimaryColor : null, width: 20, height: 20, alignment: Alignment.center),
                        onPressed: () => Navigator.pushNamed(context, ToyotaInfoSearchScreen.routeName)
                    ),
                    Text('Tìm thông tin', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
              ),
              Column(
                  children: [
                      IconButton(
                          alignment: Alignment.bottomCenter,
                          icon: SvgPicture.asset("assets/icons/config-setting.svg", color: MenuState.profile == selectedMenu ? kPrimaryColor : null, width: 20, height: 20, alignment: Alignment.center),
                          onPressed: () => Navigator.pushNamed(context, ProfileScreen.routeName)
                      ),
                      Text('Cấu hình', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.normal))
                  ]
              )
            ]
          )
      )
    );
  }
}