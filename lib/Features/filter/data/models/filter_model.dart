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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelId'] = hotelId;
    data['name'] = name;
    data['address'] = address;
    data['stars'] = stars;
    data['priceprenight'] = priceprenight;
    data['availableRooms'] = availableRooms;
    data['firstImageUrl'] = firstImageUrl;
    return data;
  }
}
