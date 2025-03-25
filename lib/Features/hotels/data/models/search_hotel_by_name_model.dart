class SearchHotelByNameModel {
  int? hotelId;
  String? name;
  String? address;
  int? stars;
  String? firstImageUrl;

  SearchHotelByNameModel(
      {this.hotelId, this.name, this.address, this.stars, this.firstImageUrl});

  SearchHotelByNameModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    address = json['address'];
    stars = json['stars'];
    firstImageUrl = json['firstImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotelId'] = this.hotelId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['stars'] = this.stars;
    data['firstImageUrl'] = this.firstImageUrl;
    return data;
  }
}