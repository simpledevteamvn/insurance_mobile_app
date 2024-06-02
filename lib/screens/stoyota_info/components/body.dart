import 'package:flutter/material.dart';
import 'package:shop_app/models/TTiQuotePolicyQueryDTO.dart';
import 'package:shop_app/models/ToyotaInfoResponse.dart';
import 'package:shop_app/screens/stoyota_info/components/info_card.dart';
import 'package:shop_app/style.dart';
import '../../../size_config.dart';

class ToyotaInfoResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    ToyotaInfoResponse infoResponse = arg['data'];
    if (infoResponse.succeeded != '00' || infoResponse.info.length == 0) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
              child: ListView(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
              SizedBox(height: getProportionateScreenHeight(5)),
              TextFormField(
                decoration: kInputDecoration("Mã lỗi"),
                initialValue: infoResponse.succeeded,
                readOnly: true,
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              TextFormField(
                decoration: kInputDecoration("Mô tả lỗi"),
                initialValue: infoResponse.message,
                readOnly: true,
              ),
            ],
            padding: EdgeInsets.only(left: 15, right: 15),
          )));
    } else {
      List<TTiQuotePolicyQueryDTO> info = infoResponse.info;
      return Container(
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ListView.builder(
              itemCount: info.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(5),
                child: Dismissible(
                  key: Key(info[index].so_khung),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: ToyotaInfoCard(toyotaInfo: info[index]),
                ),
              ),
            ),
          ));
    }
  }
}
