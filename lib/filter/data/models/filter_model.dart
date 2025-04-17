class FilterModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  FilterModel({this.statusCode, this.message, this.data});

  FilterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? hotelId;
  String? name;
  String? address;
  int? stars;
  int? priceprenight;
  int? availableRooms;
  String? firstImageUrl;

  Data(
      {this.hotelId,
      this.name,
      this.address,
      this.stars,
      this.priceprenight,
      this.availableRooms,
      this.firstImageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    address = json['address'];
    stars = json['stars'];
    priceprenight = json['priceprenight'];
    availableRooms = json['availableRooms'];
    firstImageUrl = json['firstImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotelId'] = this.hotelId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['stars'] = this.stars;
    data['priceprenight'] = this.priceprenight;
    data['availableRooms'] = this.availableRooms;
    data['firstImageUrl'] = this.firstImageUrl;
    return data;
  }
}
