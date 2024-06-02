import 'package:flutter/material.dart';
import 'package:shop_app/style.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0), child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getProportionateScreenWidth(18), color: Colors.black))),
        GestureDetector(
            onTap: press,
            child: Row(
                children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                          child: Row(
                              children: [
                                    Text("Xem thêm", style: TextStyle(color: kPrimaryColor)),
                                    Padding(padding: EdgeInsets.all(1)),
                                    Icon(Icons.arrow_forward_ios, size: 12.0, color: kPrimaryColor)
                              ]
                          )
                    )
                ]
            )
        )
      ]
    );
  }
}
