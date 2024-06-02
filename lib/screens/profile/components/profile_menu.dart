import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../style.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kTextColor, padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: Color(0xFFFFFFFF)
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(icon, color: kTextColor, width: 20),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios, size: 12.0),
          ],
        ),
      ),
    );
  }
}
