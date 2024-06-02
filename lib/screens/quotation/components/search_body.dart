import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/models/BaseResponse.dart';
import 'package:shop_app/models/ContractRequest.dart';
import 'package:shop_app/models/ContractResponse.dart';
import 'package:shop_app/screens/quotation/quotation_service.dart';
import 'package:shop_app/style.dart';
import '../../../size_config.dart';
import '../quotation_result_screen.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  String? value;
  dynamic data;
  String contractno = "";
  String quoteno = "";
  String licenseplates = "";
  String vinnumber = "";
  late DateTime contractdatefrom;
  late DateTime contractdateto;

  final loginService = QuotationService();
  List<ContractResponse> lstContracts = [];

  setData() {
    data = ContractRequest(contractno: '', vinnumber: '', page: 1);
  }

  void _searchContract() async {
    setData();
    final result = await loginService.searchContract(data, context);
    if(result != null) {
      BaseResponse baseResponse = BaseResponse.fromJson(result);
      lstContracts = baseResponse.content;
      Navigator.pushNamed(context, QuotationScreen.routeName,  arguments: {'data' : lstContracts});
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
                      TextFormField(decoration: kInputDecoration("Số hợp đồng")),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Số báo giá")),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Biển số xe")),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Số khung/ Số máy")),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      TextFormField(decoration: kInputDecoration("Tên khách hàng")),
                      SizedBox(
                          height: getProportionateScreenHeight(100),
                          child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  <Widget>[
                                    Flexible(
                                        child: TextField(
                                          decoration: kInputDecoration("Từ ngày"),
                                          onTap: _selectedDate,
                                        )
                                      ),
                                      SizedBox(width: 20.0),
                                      Flexible(
                                        child: TextField(
                                          decoration: kInputDecoration("Đến ngày"),
                                          onTap: _selectedDate,
                                        )
                                      ),
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
                                                    icon: SvgPicture.asset("assets/icons/search.svg", color: kPrimaryColorMain, width: 20, height: 20, alignment: Alignment.centerRight),
                                                    onPressed: () {
                                                      if (_formKey.currentState!.validate()) {
                                                        _formKey.currentState!.save();
                                                        KeyboardUtil.hideKeyboard(context);
                                                        _searchContract();
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

  Future<void> _selectedDate() async {
     DateTime? _picked = await showDatePicker(
         context: context,
         initialDate: DateTime.timestamp(),
         firstDate: DateTime(2000),
         lastDate: DateTime(2100),
     );

     if(_picked != null){
       setState(() {

       });
     }
  }
}
