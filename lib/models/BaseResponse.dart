
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/models/ContractResponse.dart';

@JsonSerializable()
class BaseResponse {
  late List<ContractResponse> content;
  late Map pageable;
  late int totalPages;
  late int size;
  late int number;
  late Map sort;
  late int numberOfElements;
  late bool first;
  late bool last;
  late bool empty;

  BaseResponse({required this.pageable, required this.totalPages, required this.size,
    required this.number, required this.sort, required this.numberOfElements, required this.first, required this.last, required this.empty});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    BaseResponse baseResponse = BaseResponse(
        pageable: json['pageable']??"",
        totalPages: json['totalPages']??"",
        size: json['size']??"",
        number: json['number']??"",
        sort: json['sort']??"",
        numberOfElements: json['numberOfElements']??"",
        first: json['first']??"",
        last: json['last']??"",
        empty: json['empty']??""
    );

    var content = json['content']??"";
    List<ContractResponse> lstContract =(content as List).map((i) => ContractResponse.fromJson(i)).toList();
    baseResponse.content = lstContract;
    return baseResponse;
  }

  Map<String, dynamic> toMap() {
    return {
      'pageable': pageable,
      'totalPages': totalPages,
      'size': size,
      'number': number,
      'sort': sort,
      'numberOfElements': numberOfElements,
      'first': first,
      'last': last,
      'empty': empty
    };
  }
}