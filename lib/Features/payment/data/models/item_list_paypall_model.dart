import 'package:sntegpito/Features/payment/data/models/items_paypal_model.dart';

class ItemListPaypallModel {
  List<Items>? items;

  ItemListPaypallModel({this.items});

  ItemListPaypallModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
