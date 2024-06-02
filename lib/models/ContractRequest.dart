import 'dart:ffi';

import 'package:decimal/decimal.dart';

class ContractRequest {
  late Long contractid;
  late String cancelby;
  late DateTime canceldate;
  late DateTime contractdate;
  late DateTime typingdate;
  late Long contractgroupid;
  late Long contractnextid;
  late String contractno;
  late Long contractpreviousid;
  late String contractstatus;
  late String contractsubject;
  late String contracttypeid;
  late DateTime modifiedDate;
  late String modifiedby;
  late String createdby;
  late DateTime createdDate;
  late DateTime createddate;
  late String iscancel;
  late String note;
  late int num;
  late Decimal quoteid;
  late String quoteno;
  late String updatedby;
  late DateTime updateddate;
  late String quotapolicyno;
  late DateTime frcontractdate;
  late DateTime tocontractdate;
  late String vinnumber;
  late String licenseplates;
  late String ticode;
  late String customername;
  late int page;

  ContractRequest({required this.contractno, required this.vinnumber, required this.page});

  Map<String, dynamic> toMap() {
    return {
      'contractno': contractno,
      'vinnumber': vinnumber,
      'page': page
    };
  }
}