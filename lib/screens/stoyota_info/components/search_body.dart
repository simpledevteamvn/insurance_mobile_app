import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/models/ToyotaInfoRequest.dart';
import 'package:shop_app/models/ToyotaInfoResponse.dart';
import 'package:shop_app/screens/stoyota_info/stoyota_info_result_screen.dart';
import 'package:shop_app/screens/stoyota_info/stoyota_info_service.dart';
import 'package:shop_app/style.dart';
import '../../../size_config.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  String? value;
  dynamic data;
  String b_bien_xe = "";
  String b_so_hd = "";
  String b_so_khung = "";
  String b_so_may = "";

  final toyotaService = ToyotaInfoService();
  final b_bien_xeController = TextEditingController();
  final b_so_hdController = TextEditingController();
  final b_so_khungController = TextEditingController();
  final b_so_mayController = TextEditingController();
  ToyotaInfoResponse infoResponse = ToyotaInfoResponse(succeeded: '', message: '', info: []);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    b_bien_xeController.dispose();
    b_so_hdController.dispose();
    b_so_khungController.dispose();
    b_so_mayController.dispose();
    super.dispose();
  }

  setData() {
    data = ToyotaInfoRequest(b_bien_xe: b_bien_xeController.text, b_so_hd: b_so_hdController.text, b_so_khung: b_so_khungController.text, b_so_may: b_so_mayController.text);
  }

  void _searchInfo() async {
    setData();
    final result = await toyotaService.searchToyotaInfo(data, context);
    if(result != null) {
      infoResponse = ToyotaInfoResponse.fromJson(result);
      setState(() {});
      Navigator.pushNamed(context, ToyotaInfoResultScreen.routeName,  arguments: {'data' : infoResponse});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3), )]
        ),
        child: Container(
            child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Biển số xe"), controller: b_bien_xeController),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Số hợp đồng"), controller: b_so_hdController),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Số khung"), controller: b_so_khungController),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Số máy"), controller: b_so_mayController),
                      SizedBox(
                          height: getProportionateScreenHeight(100),
                          child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  <Widget>[
                                    SizedBox(width: 4.0),
                                    Flexible(
                                        child:
                                           Container(
                                             decoration: BoxDecoration(
                                                 shape: BoxShape.circle,
                                                 boxShadow: [
                                                   BoxShadow(
                                                     color: kPrimaryColor
                                                   ),
                                                 ]
                                             ),
                                             child:
                                                IconButton(
                                                    icon: SvgPicture.asset("assets/icons/search.svg", color: kPrimaryColorMain, width: 20, height: 20, alignment: Alignment.bottomCenter),
                                                    onPressed: () {
                                                      if (_formKey.currentState!.validate()) {
                                                        _formKey.currentState!.save();
                                                        KeyboardUtil.hideKeyboard(context);
                                                        _searchInfo();
                                                      }
                                                    },
                                                ),
                                           )
                                    ),
                               ],
                            )
                      )
                    ],
                    padding: EdgeInsets.only(left: 15, right: 15),
                  )
              )
        )
    );
  }
}
