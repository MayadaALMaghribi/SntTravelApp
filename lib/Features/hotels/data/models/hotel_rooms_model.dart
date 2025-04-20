class HotelRoomsModel {
  String? roomName;
  int? maxOccupancy;
  String? roomImageUrl;
  String? description;
  int? bedCount;
  int? size;
  double? pricePerNight;
  bool? isAvailable;

  HotelRoomsModel(
      {this.roomName,
      this.maxOccupancy,
      this.roomImageUrl,
      this.description,
      this.bedCount,
      this.size,
      this.pricePerNight,
      this.isAvailable});

  HotelRoomsModel.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    maxOccupancy = json['maxOccupancy'];
    roomImageUrl = json['roomImageUrl'];
    description = json['description'];
    bedCount = json['bedCount'];
    size = json['size'];
    pricePerNight = json['pricePerNight'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['maxOccupancy'] = maxOccupancy;
    data['roomImageUrl'] = roomImageUrl;
    data['description'] = description;
    data['bedCount'] = bedCount;
    data['size'] = size;
    data['pricePerNight'] = pricePerNight;
    data['isAvailable'] = isAvailable;
    return data;
  }
}