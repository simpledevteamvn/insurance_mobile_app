import 'package:flutter/material.dart';
import 'package:shop_app/models/TTiQuotePolicyQueryDTO.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/stoyota_info/stoyota_info_result_screen.dart';

class ToyotaInfoCard extends StatelessWidget {
  const ToyotaInfoCard({
    Key? key,
    required this.toyotaInfo,
  }) : super(key: key);

  final TTiQuotePolicyQueryDTO toyotaInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToyotaInfoCardWidget(toyotaInfo: this.toyotaInfo),
    );
  }
}

class ToyotaInfoCardWidget extends StatelessWidget {
  final TTiQuotePolicyQueryDTO toyotaInfo;

  const ToyotaInfoCardWidget({
    Key? key,
    required this.toyotaInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            KeyboardUtil.hideKeyboard(context);
            Navigator.pushNamed(context, ToyotaInfoResultScreen.routeName,
                arguments: {'data': toyotaInfo});
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Số hợp đồng: " + toyotaInfo.so_hd,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Tên: " + toyotaInfo.ten,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Số điện thoại: " + toyotaInfo.mobi,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Số khung: " + toyotaInfo.so_khung,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Số máy: " + toyotaInfo.so_may,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Biển xe: " + toyotaInfo.bien_xe,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Hiệu xe: " + toyotaInfo.hieu_xe,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Địa chỉ: " + toyotaInfo.dchi,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Gói bảo hiểm: " + toyotaInfo.goi_bh,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Đơn vị đại lý: " + toyotaInfo.dvi_daily,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),
                Text(
                  "Đơn vị bảo hiểm: " + toyotaInfo.dvi_bh,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  maxLines: 2,
                ),

                SizedBox(height: 10)
              ],
            ),
          ),
        )
      ],
    );
  }
}
