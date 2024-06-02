import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/LoginResponse.dart';
import 'package:shop_app/service/utils/global_utils.dart';
import 'package:shop_app/service/utils/image_utils.dart';
import 'package:shop_app/service/utils/share_prefer_utils.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  Image avatar = Image.asset("assets/images/default.jpg");
  String? fullname = "";
  String? officename = "";
  bool isEmptyOfficename = false;

  Future<Image> _loadAvatar() async {
    LoginResponse? userInfo = await SharePreferUtils.getUserInfo();
    String? base64Avatar = await SharePreferUtils.getAvatar();
    if (userInfo != null) {
      fullname = userInfo.fullname;
      if (!GlobalUtils.isNullOrEmpty(userInfo.officename)) {
        officename = userInfo.officename;
      } else {
        isEmptyOfficename = true;
      }
    }
    if (!GlobalUtils.isNullOrEmpty(base64Avatar!)) {
      avatar = ImageUtils.imageFromBase64String(base64Avatar);
    }
    return avatar;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadAvatar(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
              child: new Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: avatar.image
                              )
                          ),
                          Positioned(
                            right: -10,
                            bottom: 0,
                            child: SizedBox(
                              height: 28,
                              width: 28,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.white),
                                  ),
                                  backgroundColor: Color(0xFFEEEEEE),
                                ),
                                onPressed: () {},
                                child: SvgPicture.asset("assets/icons/camera.svg"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Container(
                                  margin: isEmptyOfficename ? EdgeInsets.fromLTRB(0, 20, 0, 0) : EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  padding: isEmptyOfficename ? EdgeInsets.fromLTRB(25, 0, 0, 0) : EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  alignment: isEmptyOfficename ? Alignment.bottomLeft : Alignment.topLeft,
                                  child: Text(fullname!.toUpperCase(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  )
                              ),
                            Container(

                                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                alignment: Alignment.topLeft,
                                child: Flexible(
                                    child: Text(officename!,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontWeight: FontWeight.normal),
                                    )
                                )
                            ),
                          ],
                        ),
                    )
                  ],
              )
          );
        }
    );
  }
}