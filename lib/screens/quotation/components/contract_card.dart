import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/ContractResponse.dart';
import 'package:shop_app/screens/quotation/quotation_detail_screen.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/style.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({
    Key? key,
    required this.contract,
  }) : super(key: key);

  final ContractResponse contract;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContractCardWidget(contract: this.contract),
    );
  }
}

class ContractCardWidget extends StatelessWidget {
  final ContractResponse contract;
  const ContractCardWidget({
    Key? key,
    required this.contract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            KeyboardUtil.hideKeyboard(context);
            Navigator.pushNamed(context, QuotationDetailScreen.routeName,  arguments: {'data' : contract});
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: kTextColorBorder,
                    width: 1,
                  )
                )
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding (
                  padding: EdgeInsets.all(5), //apply padding to all four sides
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Số: " + contract.contractno,
                          style: TextStyle(color: kPrimaryColor, fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2
                        ),
                        SvgPicture.asset(contract.contractstatus == '2' ? "assets/icons/success.svg" : (
                            contract.contractstatus == '3' ? "assets/icons/success.svg" : "assets/icons/clock.svg"
                        ),
                        color: contract.contractstatus == '2' ? Colors.green : (contract.contractstatus == '3' ? Colors.black26 : Colors.orange),
                        width: 11, height: 11)
                      ]
                  )
                ),
                Padding (
                  padding: EdgeInsets.all(5), //apply padding to all four sides
                  child:Text(
                    "Công ty bảo hiểm: " + contract.officename,
                    style: TextStyle(color: kTextColor, fontSize: 12),
                    maxLines: 2
                  )
                ),
                Padding (
                    padding: EdgeInsets.all(5), //apply padding to all four sides
                    child:Text(
                        "Số khung: " + contract.vinnumber,
                        style: TextStyle(color: kTextColor, fontSize: 12),
                        maxLines: 2
                    )
                ),
                Padding (
                  padding: EdgeInsets.all(5), //apply padding to all four sides
                  child:Text(
                    "Kh.hàng: " + contract.customername,
                    style: TextStyle(color: kTextColor, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false
                  )
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        )
      ],
    ); }
}
