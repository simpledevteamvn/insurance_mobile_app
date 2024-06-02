

class ToyotaInfoRequest {
  late String b_bien_xe;
  late String b_so_hd;
  late String b_so_khung;
  late String b_so_may;

  ToyotaInfoRequest(
      {required this.b_bien_xe,
      required this.b_so_hd,
      required this.b_so_khung,
      required this.b_so_may});

  Map<String, dynamic> toMap() {
    return {
      'b_bien_xe': b_bien_xe,
      'b_so_hd': b_so_hd,
      'b_so_khung': b_so_khung,
      'b_so_may': b_so_may
    };
  }
}
