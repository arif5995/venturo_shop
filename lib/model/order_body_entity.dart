class OrderBodyEntity {
  String? nominalDiskon;
  String? nominalPesanan;
  List<Items>? items;

  OrderBodyEntity({this.nominalDiskon, this.nominalPesanan, this.items});

  OrderBodyEntity.fromJson(Map<String, dynamic> json) {
    nominalDiskon = json['nominal_diskon'];
    nominalPesanan = json['nominal_pesanan'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nominal_diskon'] = this.nominalDiskon;
    data['nominal_pesanan'] = this.nominalPesanan;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? harga;
  String? catatan;

  Items({this.id, this.harga, this.catatan});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    harga = json['harga'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['harga'] = this.harga;
    data['catatan'] = this.catatan;
    return data;
  }
}
