class ItemDetails {
  int? hotelId;
  String? name;
  String? address;
  int? pricePerNight;
  int? id;
  String? description;
  int? activityId;
  int? price;

  ItemDetails(
      {this.hotelId,
      this.name,
      this.address,
      this.pricePerNight,
      this.id,
      this.description,
      this.activityId,
      this.price});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    address = json['address'];
    pricePerNight = json['pricePerNight'];
    id = json['id'];
    description = json['description'];
    activityId = json['activityId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelId'] = hotelId;
    data['name'] = name;
    data['address'] = address;
    data['pricePerNight'] = pricePerNight;
    data['id'] = id;
    data['description'] = description;
    data['activityId'] = activityId;
    data['price'] = price;
    return data;
  }
}
