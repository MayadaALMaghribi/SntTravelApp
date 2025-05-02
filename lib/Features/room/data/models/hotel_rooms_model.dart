class HotelRoomsModel {
  String? roomName;
  int? maxOccupancy;
  String? roomImageUrl;
  String? description;
  int? bedCount;
  int? size;
  double? pricePerNight;
  bool? isAvailable;
  int?roomId;

  HotelRoomsModel(
      {this.roomName,
      this.roomId,
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
    roomId=json['roomId'];
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
    data['roomId']=roomId;
    return data;
  }
}