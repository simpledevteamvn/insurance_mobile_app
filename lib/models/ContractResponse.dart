import 'dart:ffi';

import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ContractResponse {
  late String vinnumber;
  late String vehicletypename;
  late String vehicletypeid;
  late String updatedby;
  late String tiCode;
  late String salename;
  late String salecode;
  late String restoredreason;
  late String restoredate;
  late String restoreby;
  late String quotesubject;
  late String quoteno;
  late String quotatypeid;
  late String quotatype;
  late String quotapolicyno;
  late String purposeofusename;
  late String purposeofuseid;
  late String policytypeid;
  late String officename;
  late String officecode;
  late String officebrcdName;
  late String officebrcd;
  late String note;
  late String modelyear;
  late String modelname;
  late String modelcode;
  late String mgfdate;
  late String mess;
  late String licenseplates;
  late String issend;
  late String isrestore;
  late String isfree;
  late String isdeleted;
  late String iscancel;
  late String isapprove;
  late String insuredtel;
  late String insuredname;
  late String insuredemail;
  late String insuredaddress;
  late String errorcode = "";
  late String enginenumber;
  late String editionname;
  late String editioncode;
  late String deletedreason;
  late String deletedby;
  late String cwdid;
  late String custwardName;
  late String custwardcd;
  late String custtypeName;
  late String custtype;
  late String custtel;
  late String custprovinceName;
  late String custprovincecd;
  late String customername;
  late String customercode;
  late String custidno;
  late String custemail;
  late String custdistrictName;
  late String custdistrictcd;
  late String custaddress;
  late String currency;
  late String createdby;
  late String countryname;
  late String countrycode;
  late String contracttypeid;
  late String contractsubject;
  late String contractstatus;
  late String contractno;
  late String contacttel;
  late String contactname;
  late String contactemail;
  late String contactaddress;
  late String classname;
  late String classcode;
  late String ccy;
  late String capacity;
  late String cancelreason;
  late String cancelby;
  late String brandname;
  late String brandcode;
  late String beneficiaryterms;
  late String beneficiarytel;
  late String beneficiaryrepresent;
  late String beneficiarypos;
  late String beneficiaryname;
  late String beneficiaryemail;
  late String beneficiaryaddress;
  late String bankname;
  late String bankcode;
  late String bankaccountname;
  late String bankaccount;
  late String approveby;
  late String agentname;
  late String agentcode;
  late Long quoteid;
  late Long quotavehicleid;
  late Long quotapolicyid;
  late Long lastcontractid;
  late Long insurancecompanyid;
  late Long guesttypeid;
  late Long guestid;
  late Long contractpreviousid;
  late Long contractnextid;
  late Long contractid;
  late Long contractgroupid;
  late Long companyinsuranceid;
  late Long companyid;
  late Long branchinsuranceid;

  // late TtiQuotevehicleDTO quotevehicle;
  // late List<TtiQuotapolicyDTO> quotapolicys;
  // late List<TtiQuotaFeeDTO> quotafeesInsurancerisk;
  // late List<TtiQuotaFeeDTO> quotafeesFeemin;
  // late List<TtiQuotaFeeDTO> quotafeesDKBS;
  // late List<TtiQuotaFeeDTO> quotafeesDisfee;
  late int seatingcapacity;
  late int quotastatus;
  late int num;
  late int cwdtype;
  late int cutofday;
  late int totalRow;
  late DateTime updateddate;
  late DateTime typingdate;
  late DateTime trandate;
  late DateTime registrationdate;
  late DateTime quotedate;
  late DateTime issueddate;
  late DateTime deliverydate;
  late DateTime deleteddate;
  late DateTime cutofdate;
  late DateTime createdDate;
  late DateTime contractdate;
  late DateTime canceldate;
  late DateTime approvedate;
  late DateTime applieddate;
  late DateTime appDate;
  late Decimal tonnage;
  late Decimal marketprice;
  late Decimal invoiceprice;
  late Decimal exchangerate;

  ContractResponse({required this.contractno, required this.contractstatus, required this.customername, required this.agentcode,
    required this.vinnumber, required this.officename});

  factory ContractResponse.fromJson(Map<String, dynamic> json) {
    ContractResponse contractResponse = ContractResponse(
        contractno: json['contractno']??"",
        contractstatus: json['contractstatus']??"",
        customername: json['customername']??"",
        agentcode: json['agentcode']??"",
        officename: json['officename']??"",
        vinnumber: json['vinnumber']??""
    );

    contractResponse.vehicletypename= json['vehicletypename']??"";
    contractResponse.vehicletypeid= json['vehicletypeid']??"";
    contractResponse.updatedby= json['updatedby']??"";
    contractResponse.tiCode= json['tiCode']??"";
    contractResponse.salename= json['salename']??"";
    contractResponse.salecode= json['salecode']??"";
    contractResponse.restoredreason= json['restoredreason']??"";
    contractResponse.restoredate= json['restoredate']??"";
    contractResponse.restoreby= json['restoreby']??"";
    contractResponse.quotesubject= json['quotesubject']??"";
    contractResponse.quoteno= json['quoteno']??"";
    contractResponse.quotatypeid= json['quotatypeid']??"";
    contractResponse.quotatype= json['quotatype']??"";
    contractResponse.quotapolicyno= json['quotapolicyno']??"";
    contractResponse.purposeofusename= json['purposeofusename']??"";
    contractResponse.purposeofuseid= json['purposeofuseid']??"";
    contractResponse.policytypeid= json['policytypeid']??"";
    contractResponse.officecode= json['officecode']??"";
    contractResponse.officebrcdName= json['officebrcdName']??"";
    contractResponse.officebrcd= json['officebrcd']??"";
    contractResponse.note= json['note']??"";
    contractResponse.modelyear= json['modelyear']??"";
    contractResponse.modelname= json['modelname']??"";
    contractResponse.modelcode= json['modelcode']??"";
    contractResponse.mgfdate= json['mgfdate']??"";
    contractResponse.mess= json['mess']??"";
    contractResponse.licenseplates= json['licenseplates']??"";
    contractResponse.issend= json['issend']??"";
    contractResponse.isrestore= json['isrestore']??"";
    contractResponse.isfree= json['isfree']??"";
    contractResponse.isdeleted= json['isdeleted']??"";
    contractResponse.iscancel= json['iscancel']??"";
    contractResponse.isapprove= json['isapprove']??"";
    contractResponse.insuredtel= json['insuredtel']??"";
    contractResponse.insuredname= json['insuredname']??"";
    contractResponse.insuredemail= json['insuredemail']??"";
    contractResponse.insuredaddress= json['insuredaddress']??"";
    contractResponse.errorcode= json['errorcode']??"";
    contractResponse.enginenumber= json['enginenumber']??"";
    contractResponse.editionname= json['editionname']??"";
    contractResponse.editioncode= json['editioncode']??"";
    contractResponse.deletedreason= json['deletedreason']??"";
    contractResponse.deletedby= json['deletedby']??"";
    contractResponse.cwdid= json['cwdid']??"";
    contractResponse.custwardName= json['custwardName']??"";
    contractResponse.custwardcd= json['custwardcd']??"";
    contractResponse.custtypeName= json['custtypeName']??"";
    contractResponse.custtype= json['custtype']??"";
    contractResponse.custtel= json['custtel']??"";
    contractResponse.custprovinceName= json['custprovinceName']??"";
    contractResponse.custprovincecd= json['custprovincecd']??"";
    contractResponse.customercode= json['customercode']??"";
    contractResponse.custidno= json['custidno']??"";
    contractResponse.custemail= json['custemail']??"";
    contractResponse.custdistrictName= json['custdistrictName']??"";
    contractResponse.custdistrictcd= json['custdistrictcd']??"";
    contractResponse.custaddress= json['custaddress']??"";
    contractResponse.currency= json['currency']??"";
    contractResponse.createdby= json['createdby']??"";
    contractResponse.countryname= json['countryname']??"";
    contractResponse.countrycode= json['countrycode']??"";
    contractResponse.contracttypeid= json['contracttypeid']??"";
    contractResponse.contractsubject= json['contractsubject']??"";
    contractResponse.contacttel= json['contacttel']??"";
    contractResponse.contactname= json['contactname']??"";
    contractResponse.contactemail= json['contactemail']??"";
    contractResponse.contactaddress= json['contactaddress']??"";
    contractResponse.classname= json['classname']??"";
    contractResponse.classcode= json['classcode']??"";
    contractResponse.ccy= json['ccy']??"";
    contractResponse.capacity= json['capacity']??"";
    contractResponse.cancelreason= json['cancelreason']??"";
    contractResponse.cancelby= json['cancelby']??"";
    contractResponse.brandname= json['brandname']??"";
    contractResponse.brandcode= json['brandcode']??"";
    contractResponse.beneficiaryterms= json['beneficiaryterms']??"";
    contractResponse.beneficiarytel= json['beneficiarytel']??"";
    contractResponse.beneficiaryrepresent= json['beneficiaryrepresent']??"";
    contractResponse.beneficiarypos= json['beneficiarypos']??"";
    contractResponse.beneficiaryname= json['beneficiaryname']??"";
    contractResponse.beneficiaryemail= json['beneficiaryemail']??"";
    contractResponse.beneficiaryaddress= json['beneficiaryaddress']??"";
    contractResponse.bankname= json['bankname']??"";
    contractResponse.bankcode= json['bankcode']??"";
    contractResponse.bankaccountname= json['bankaccountname']??"";
    contractResponse.bankaccount= json['bankaccount']??"";
    contractResponse.approveby= json['approveby']??"";
    contractResponse.agentname= json['agentname']??"";

    // contractResponse.updateddate = ((json['updateddate'] == null || json['updateddate'] == "") ? null : GlobalUtils.convertStringToDate(json['updateddate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['typingdate'] == null || json['typingdate'] == "") ? null : GlobalUtils.convertStringToDate(json['typingdate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['trandate'] == null || json['trandate'] == "") ? null : GlobalUtils.convertStringToDate(json['trandate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['registrationdate'] == null || json['registrationdate'] == "") ? null : GlobalUtils.convertStringToDate(json['registrationdate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['quotedate'] == null || json['quotedate'] == "") ? null : GlobalUtils.convertStringToDate(json['quotedate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['issueddate'] == null || json['issueddate'] == "") ? null : GlobalUtils.convertStringToDate(json['issueddate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['deliverydate'] == null || json['deliverydate'] == "") ? null : GlobalUtils.convertStringToDate(json['deliverydate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['deleteddate'] == null || json['deleteddate'] == "") ? null : GlobalUtils.convertStringToDate(json['deleteddate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['cutofdate'] == null || json['cutofdate'] == "") ? null : GlobalUtils.convertStringToDate(json['cutofdate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['createdDate'] == null || json['createdDate'] == "") ? null : GlobalUtils.convertStringToDate(json['createdDate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['contractdate'] == null || json['contractdate'] == "") ? null : GlobalUtils.convertStringToDate(json['contractdate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['canceldate'] == null || json['canceldate'] == "") ? null : GlobalUtils.convertStringToDate(json['canceldate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['approvedate'] == null || json['approvedate'] == "") ? null : GlobalUtils.convertStringToDate(json['approvedate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['applieddate'] == null || json['applieddate'] == "") ? null : GlobalUtils.convertStringToDate(json['applieddate'], 'dd-mm-yyyy'))!;
    // contractResponse.updateddate = ((json['appDate'] == null || json['appDate'] == "") ? null : GlobalUtils.convertStringToDate(json['appDate'], 'dd-mm-yyyy'))!;

    // contractResponse.tonnage = ((json['tonnage'] == null || json['tonnage'] == "") ? null : Decimal.parse(json['tonnage']))!;
    // contractResponse.marketprice = ((json['marketprice'] == null || json['marketprice'] == "") ? null : Decimal.parse(json['marketprice']))!;
    // contractResponse.invoiceprice = ((json['invoiceprice'] == null || json['invoiceprice'] == "") ? null : Decimal.parse(json['invoiceprice']))!;
    // contractResponse.exchangerate = ((json['exchangerate'] == null || json['exchangerate'] == "") ? null : Decimal.parse(json['exchangerate']))!;
    //
    // contractResponse.seatingcapacity = ((json['seatingcapacity'] == null || json['seatingcapacity'] == "") ? null : int.parse(json['seatingcapacity']))!;
    // contractResponse.quotastatus = ((json['quotastatus'] == null || json['quotastatus'] == "") ? null : int.parse(json['quotastatus']))!;
    // contractResponse.num = ((json['num'] == null || json['num'] == "") ? null : int.parse(json['num']))!;
    // contractResponse.cwdtype = ((json['cwdtype'] == null || json['cwdtype'] == "") ? null : int.parse(json['cwdtype']))!;
    // contractResponse.cutofday = ((json['cutofday'] == null || json['cutofday'] == "") ? null : int.parse(json['cutofday']))!;
    // contractResponse.totalRow = ((json['totalRow'] == null || json['totalRow'] == "") ? null : int.parse(json['totalRow']))!;
    //
    // contractResponse.quoteid = ((json['quoteid'] == null || json['quoteid'] == "") ? null : int.parse(json['quoteid']))! as Long;
    // contractResponse.quotavehicleid = ((json['quotavehicleid'] == null || json['quotavehicleid'] == "") ? null : int.parse(json['quotavehicleid']))! as Long;
    // contractResponse.quotapolicyid = ((json['quotapolicyid'] == null || json['quotapolicyid'] == "") ? null : int.parse(json['quotapolicyid']))! as Long;
    // contractResponse.lastcontractid = ((json['lastcontractid'] == null || json['lastcontractid'] == "") ? null : int.parse(json['lastcontractid']))! as Long;
    // contractResponse.insurancecompanyid = ((json['insurancecompanyid'] == null || json['insurancecompanyid'] == "") ? null : int.parse(json['insurancecompanyid']))! as Long;
    // contractResponse.guesttypeid = ((json['guesttypeid'] == null || json['guesttypeid'] == "") ? null : int.parse(json['guesttypeid']))! as Long;
    // contractResponse.guestid = ((json['guestid'] == null || json['guestid'] == "") ? null : int.parse(json['guestid']))! as Long;
    // contractResponse.contractpreviousid = ((json['contractpreviousid'] == null || json['contractpreviousid'] == "") ? null : int.parse(json['contractpreviousid']))! as Long;
    // contractResponse.contractnextid = ((json['contractnextid'] == null || json['contractnextid'] == "") ? null : int.parse(json['contractnextid']))! as Long;
    // contractResponse.contractid = ((json['contractid'] == null || json['contractid'] == "") ? null : int.parse(json['contractid']))! as Long;
    // contractResponse.contractgroupid = ((json['contractgroupid'] == null || json['contractgroupid'] == "") ? null : int.parse(json['contractgroupid']))! as Long;
    // contractResponse.companyinsuranceid = ((json['companyinsuranceid'] == null || json['companyinsuranceid'] == "") ? null : int.parse(json['companyinsuranceid']))! as Long;
    // contractResponse.companyid = ((json['companyid'] == null || json['companyid'] == "") ? null : int.parse(json['companyid']))! as Long;
    // contractResponse.branchinsuranceid = ((json['branchinsuranceid'] == null || json['branchinsuranceid'] == "") ? null : int.parse(json['branchinsuranceid']))! as Long;

    return contractResponse;
  }

  Map<String, dynamic> toMap() {
    return {
      // 'contractno': contractno,
      // 'contractstatus' : contractstatus,
      // 'customername': customername,
      // 'agentcode': agentcode,
      // 'officename': officename,
      // 'vinnumber': vinnumber

      'appDate':appDate,
      'applieddate':applieddate,
      'approvedate':approvedate,
      'canceldate':canceldate,
      'contractdate':contractdate,
      'createdDate':createdDate,
      'cutofdate':cutofdate,
      'deleteddate':deleteddate,
      'deliverydate':deliverydate,
      'issueddate':issueddate,
      'quotedate':quotedate,
      'registrationdate':registrationdate,
      'trandate':trandate,
      'typingdate':typingdate,
      'updateddate':updateddate,
      'exchangerate':exchangerate,
      'invoiceprice':invoiceprice,
      'marketprice':marketprice,
      'tonnage':tonnage,
      'cutofday':cutofday,
      'cwdtype':cwdtype,
      'num':num,
      'quotastatus':quotastatus,
      'seatingcapacity':seatingcapacity,
      'totalRow':totalRow,
      'branchinsuranceid':branchinsuranceid,
      'companyid':companyid,
      'companyinsuranceid':companyinsuranceid,
      'contractgroupid':contractgroupid,
      'contractid':contractid,
      'contractnextid':contractnextid,
      'contractpreviousid':contractpreviousid,
      'guestid':guestid,
      'guesttypeid':guesttypeid,
      'insurancecompanyid':insurancecompanyid,
      'lastcontractid':lastcontractid,
      'quotapolicyid':quotapolicyid,
      'quotavehicleid':quotavehicleid,
      'quoteid':quoteid,
      'agentcode':agentcode,
      'agentname':agentname,
      'approveby':approveby,
      'bankaccount':bankaccount,
      'bankaccountname':bankaccountname,
      'bankcode':bankcode,
      'bankname':bankname,
      'beneficiaryaddress':beneficiaryaddress,
      'beneficiaryemail':beneficiaryemail,
      'beneficiaryname':beneficiaryname,
      'beneficiarypos':beneficiarypos,
      'beneficiaryrepresent':beneficiaryrepresent,
      'beneficiarytel':beneficiarytel,
      'beneficiaryterms':beneficiaryterms,
      'brandcode':brandcode,
      'brandname':brandname,
      'cancelby':cancelby,
      'cancelreason':cancelreason,
      'capacity':capacity,
      'ccy':ccy,
      'classcode':classcode,
      'classname':classname,
      'contactaddress':contactaddress,
      'contactemail':contactemail,
      'contactname':contactname,
      'contacttel':contacttel,
      'contractno':contractno,
      'contractstatus':contractstatus,
      'contractsubject':contractsubject,
      'contracttypeid':contracttypeid,
      'countrycode':countrycode,
      'countryname':countryname,
      'createdby':createdby,
      'currency':currency,
      'custaddress':custaddress,
      'custdistrictcd':custdistrictcd,
      'custdistrictName':custdistrictName,
      'custemail':custemail,
      'custidno':custidno,
      'customercode':customercode,
      'customername':customername,
      'custprovincecd':custprovincecd,
      'custprovinceName':custprovinceName,
      'custtel':custtel,
      'custtype':custtype,
      'custtypeName':custtypeName,
      'custwardcd':custwardcd,
      'custwardName':custwardName,
      'cwdid':cwdid,
      'deletedby':deletedby,
      'deletedreason':deletedreason,
      'editioncode':editioncode,
      'editionname':editionname,
      'enginenumber':enginenumber,
      'errorcode':errorcode,
      'insuredaddress':insuredaddress,
      'insuredemail':insuredemail,
      'insuredname':insuredname,
      'insuredtel':insuredtel,
      'isapprove':isapprove,
      'iscancel':iscancel,
      'isdeleted':isdeleted,
      'isfree':isfree,
      'isrestore':isrestore,
      'issend':issend,
      'licenseplates':licenseplates,
      'mess':mess,
      'mgfdate':mgfdate,
      'modelcode':modelcode,
      'modelname':modelname,
      'modelyear':modelyear,
      'note':note,
      'officebrcd':officebrcd,
      'officebrcdName':officebrcdName,
      'officecode':officecode,
      'officename':officename,
      'policytypeid':policytypeid,
      'purposeofuseid':purposeofuseid,
      'purposeofusename':purposeofusename,
      'quotapolicyno':quotapolicyno,
      'quotatype':quotatype,
      'quotatypeid':quotatypeid,
      'quoteno':quoteno,
      'quotesubject':quotesubject,
      'restoreby':restoreby,
      'restoredate':restoredate,
      'restoredreason':restoredreason,
      'salecode':salecode,
      'salename':salename,
      'tiCode':tiCode,
      'updatedby':updatedby,
      'vehicletypeid':vehicletypeid,
      'vehicletypename':vehicletypename,
      'vinnumber':vinnumber

    };
  }
}
