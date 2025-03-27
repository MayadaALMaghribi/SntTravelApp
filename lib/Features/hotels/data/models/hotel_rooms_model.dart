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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomName'] = this.roomName;
    data['maxOccupancy'] = this.maxOccupancy;
    data['roomImageUrl'] = this.roomImageUrl;
    data['description'] = this.description;
    data['bedCount'] = this.bedCount;
    data['size'] = this.size;
    data['pricePerNight'] = this.pricePerNight;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}