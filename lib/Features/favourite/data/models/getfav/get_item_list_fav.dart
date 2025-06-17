class ItemDetails {
  int? hotelId;
  String? name;
  String? address;
  double? pricePerNight;
  int? id;
  String? description;
  int? activityId;
  double? price;
  String? image;
  String? moreDescription;

  ItemDetails(
      {this.hotelId,
      this.name,
      this.address,
      this.pricePerNight,
      this.id,
      this.description,
      this.activityId,
      this.image,
      this.price,
      this.moreDescription});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    address = json['address'];
    pricePerNight = (json['pricePerNight'] as num?)?.toDouble();
    id = json['id'];
    description = json['description'];
    activityId = (json['activityId'] as num?)?.toInt();
    price = (json['price'] as num?)?.toDouble();
    image = json['image'] ?? json['imageUrl'];
    moreDescription = json['moreDescription'];
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
    data['image'] = image;
    data['moreDescription'] = moreDescription;
    return data;
  }
}
