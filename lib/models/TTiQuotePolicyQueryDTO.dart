class TTiQuotePolicyQueryDTO {
  late String bien_xe;
  late String so_hd;
  late String so_khung;
  late String so_may;
  late String hieu_xe;
  late String ten;
  late String dchi;
  late String mobi;
  late String dvi_bh;
  late String dvi_daily;
  late String goi_bh;
  late String muc_kt;
  late String ngay_hl;
  late String ngay_kt;

  TTiQuotePolicyQueryDTO(
      {required this.bien_xe,
      required this.so_hd,
      required this.so_khung,
      required this.so_may,
      required this.hieu_xe,
      required this.ten,
      required this.dchi,
      required this.mobi,
      required this.dvi_bh,
      required this.dvi_daily,
      required this.goi_bh,
      required this.muc_kt,
      required this.ngay_hl,
      required this.ngay_kt});

  factory TTiQuotePolicyQueryDTO.fromJson(Map<String, dynamic> json) {
    return TTiQuotePolicyQueryDTO(
      bien_xe: json['bien_xe'] ?? "",
      so_hd: json['so_hd'] ?? "",
      so_khung: json['so_khung'] ?? "",
      so_may: json['so_may'] ?? "",
      hieu_xe: json['hieu_xe'] ?? "",
      ten: json['ten'] ?? "",
      dchi: json['dchi'] ?? "",
      mobi: json['mobi'] ?? "",
      dvi_bh: json['dvi_bh'] ?? "",
      dvi_daily: json['dvi_daily'] ?? "",
      goi_bh: json['goi_bh'] ?? "",
      muc_kt: json['muc_kt'] ?? "",
      ngay_hl: json['ngay_hl'] ?? "",
      ngay_kt: json['ngay_kt'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bien_xe': bien_xe,
      'so_hd': so_hd,
      'so_khung': so_khung,
      'so_may': so_may,
      'hieu_xe': hieu_xe,
      'ten': ten,
      'dchi': dchi,
      'mobi': mobi,
      'dvi_bh': dvi_bh,
      'dvi_daily': dvi_daily,
      'goi_bh': goi_bh,
      'muc_kt': muc_kt,
      'ngay_hl': ngay_hl,
      'ngay_kt': ngay_kt
    };
  }
}
