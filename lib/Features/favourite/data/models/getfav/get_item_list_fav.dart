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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotelId'] = this.hotelId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pricePerNight'] = this.pricePerNight;
    data['id'] = this.id;
    data['description'] = this.description;
    data['activityId'] = this.activityId;
    data['price'] = this.price;
    return data;
  }
}
