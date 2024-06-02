
import 'package:shop_app/models/TTiQuotePolicyQueryDTO.dart';

class ToyotaInfoResponse {
  late String succeeded;
  late String message;
  late List<TTiQuotePolicyQueryDTO> info;

  ToyotaInfoResponse(
      {required this.succeeded, required this.message, required this.info});

  factory ToyotaInfoResponse.fromJson(Map<String, dynamic> json) {
    ToyotaInfoResponse toyotaInfoResponse = ToyotaInfoResponse(
        succeeded: json['succeeded'] ?? "",
        message: json['message'] ?? "",
        info: []);

    var content = json['info'] ?? "";
    if (content != null && content != "") {
      List<TTiQuotePolicyQueryDTO> info = (content as List)
          .map((i) => TTiQuotePolicyQueryDTO.fromJson(i))
          .toList();
      toyotaInfoResponse.info = info;
    }

    return toyotaInfoResponse;
  }

  Map<String, dynamic> toMap() {
    return {'succeeded': succeeded, 'message': message, 'info': info};
  }
}
