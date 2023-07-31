class VoucherEntity {
  int? statusCode;
  List<Datas>? datas;

  VoucherEntity({this.statusCode, this.datas});

  VoucherEntity.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['datas'] != null) {
      datas = <Datas>[];
      json['datas'].forEach((v) {
        datas!.add(new Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.datas != null) {
      data['datas'] = this.datas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  int? id;
  String? kode;
  String? gambar;
  int? nominal;
  String? status;
  String? createdAt;
  String? updatedAt;

  Datas(
      {this.id,
        this.kode,
        this.gambar,
        this.nominal,
        this.status,
        this.createdAt,
        this.updatedAt});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    gambar = json['gambar'];
    nominal = json['nominal'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode'] = this.kode;
    data['gambar'] = this.gambar;
    data['nominal'] = this.nominal;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
