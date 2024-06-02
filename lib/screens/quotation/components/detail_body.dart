import 'package:flutter/material.dart';
import 'package:shop_app/models/ContractResponse.dart';

import '../../../size_config.dart';
import '../../../style.dart';

class DetailBody extends StatefulWidget {
  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  final _formKey = GlobalKey<FormState>();
  String? value;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    ContractResponse data = arg['data'];

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Color(0xFFA51739),
          labelColor: Color(0xFFA51739),
          dividerColor: Color(0xFFA51739),
          unselectedLabelColor: Color(0xFFA51739),
          tabs: <Widget>[
            Tab(
              text: "TT Chung",
            ),
            Tab(
              text: "TT Xe",
            ),
            Tab(
              text: "TT Khách hàng",
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                    child: ListView(
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Số hợp đồng"),
                      initialValue: data.contractno,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    // TextFormField(
                    //     decoration: kInputDecoration("Tiêu đề hợp đồng"),
                    //   initialValue: data.contract,
                    //   readOnly: true,),
                    // SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(
                        decoration: kInputDecoration("Trạng thái hợp đồng"),
                      initialValue: data.contractstatus,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Số báo giá"),
                      initialValue: data.quoteno,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("NV KD"),
                      initialValue: data.salename,
                      readOnly: true,),
                  ],
                  padding: EdgeInsets.only(left: 15, right: 15),
                ))),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                    child: ListView(
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Biển số xe"),
                      initialValue: data.licenseplates,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(
                        decoration: kInputDecoration("Số khung/ Số máy"),
                      initialValue: data.vinnumber + "/" + data.enginenumber,
                      readOnly: true,),
                  ],
                  padding: EdgeInsets.only(left: 15, right: 15),
                ))),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                    child: ListView(
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Tên KH"),
                      initialValue: data.customername,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Loại KH"),
                      initialValue: data.custtype,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("MST"),
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("SĐT"),
                      initialValue: data.custtel,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("Thư điện tử"),
                      initialValue: data.custemail,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    TextFormField(decoration: kInputDecoration("CCCD"),
                      initialValue: data.custidno,
                      readOnly: true,),
                    SizedBox(height: getProportionateScreenHeight(5)),
                  ],
                  padding: EdgeInsets.only(left: 15, right: 15),
                ))),
          ],
        ),
      ),
    );
  }
}
