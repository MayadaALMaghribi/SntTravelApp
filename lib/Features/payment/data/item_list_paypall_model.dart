import 'package:sntegpito/Features/payment/data/items_paypal_model.dart';

class ItemListPaypallModel {
  List<Items>? items;

  ItemListPaypallModel({this.items});

  ItemListPaypallModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
