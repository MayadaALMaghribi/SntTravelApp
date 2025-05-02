class AmountPaypallModel {
  final String? total;
  final String? currency;
  final Details? details;

  AmountPaypallModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  AmountPaypallModel.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        currency = json['currency'],
        details =
            json['details'] != null ? Details.fromJson(json['details']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = this.total;
    data['currency'] = this.currency;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Details.fromJson(Map<String, dynamic> json)
      : subtotal = json['subtotal'],
        shipping = json['shipping'],
        shippingDiscount = json['shipping_discount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['subtotal'] = this.subtotal;
    data['shipping'] = this.shipping;
    data['shipping_discount'] = this.shippingDiscount;
    return data;
  }
}
