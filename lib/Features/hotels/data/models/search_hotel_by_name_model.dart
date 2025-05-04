class SearchHotelByNameModel {
  int? hotelId;
  String? name;
  String? address;
  int? stars;
  String? firstImageUrl;
  String? locationName;

  SearchHotelByNameModel(
      {this.hotelId,
      this.name,
      this.address,
      this.stars,
      this.firstImageUrl,
      this.locationName});

  SearchHotelByNameModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    address = json['address'];
    stars = json['stars'];
    firstImageUrl = json['firstImageUrl'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelId'] = hotelId;
    data['name'] = name;
    data['address'] = address;
    data['stars'] = stars;
    data['firstImageUrl'] = firstImageUrl;
    data['locationName'] = locationName;
    return data;
  }
}
