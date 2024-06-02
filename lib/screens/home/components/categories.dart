import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/style.dart';
import 'package:collection/collection.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {

  String menuType;
  String menuTitle;
  Categories({required this.menuType, required this.menuTitle});

  @override
  _CategoriesState createState() => _CategoriesState(menuType: menuType, menuTitle: menuTitle);
}

class _CategoriesState extends State<Categories> {

  String menuType;
  String menuTitle;
  _CategoriesState({required this.menuType, required this.menuTitle});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/file-document.svg", "text": "Báo giá", "menuType" : "1"},
      {"icon": "assets/icons/file-tick.svg", "text": "GCN", "menuType" : "1"},
      {"icon": "assets/icons/file-download.svg", "text": "Hợp đồng", "menuType" : "1"},
      {"icon": "assets/icons/file-cancel.svg", "text": "Hủy GCN", "menuType" : "1"},
      {"icon": "assets/icons/file-expire.svg", "text": "HĐ hết hạn", "menuType" : "1"},
      {"icon": "assets/icons/file-person.svg", "text": "HS Khách hàng", "menuType" : "1"},
      {"icon": "assets/icons/file-money.svg", "text": "HS bồi thường", "menuType" : "1"},
      {"icon": "assets/icons/file-bar.svg", "text": "BC tổn thất", "menuType" : "1"},
      {"icon": "assets/icons/report-fee.svg", "text": "DT phí BH1", "menuType" : "2"},
      {"icon": "assets/icons/report-fee-2.svg", "text": "DT phí BH2", "menuType" : "2"},
      {"icon": "assets/icons/report-quote.svg", "text": "DL Cấp đơn", "menuType" : "2"},
      {"icon": "assets/icons/report-fee-3.svg", "text": "BC Hủy đơn", "menuType" : "2"},
      {"icon": "assets/icons/report-renew.svg", "text": "Tái tục", "menuType" : "2"},
      {"icon": "assets/icons/report-renew-guess.svg", "text": "Tái tục dự kiến", "menuType" : "2"},
    ];

    List<Widget> getList(menuType) {
      return categories.map((e) => e["menuType"] == menuType ? Row(children: <Widget>[
        CategoryCard(icon: e["icon"], text: e["text"], press: () {})]) : null).whereNotNull().toList();
    }

    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3), )]
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10), child: SectionTitle(title: this.menuTitle, press: () {})),
            Padding(padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              child: CustomScrollView(primary: false, shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(5),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                      children: getList(this.menuType)
                    )
                  )
                ]
              )
            )
          ]
      )
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), shape: BoxShape.rectangle, boxShadow: [BoxShadow(color: kPrimaryColor)]),
              child: SvgPicture.asset(icon!, color: kPrimaryColorMain),
            ),
            SizedBox(height: 12),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
