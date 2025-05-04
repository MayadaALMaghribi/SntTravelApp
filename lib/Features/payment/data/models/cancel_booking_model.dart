class CancelBookingModel {
  String? message;
  int? roomId;
  bool? isAvailable;

  CancelBookingModel({this.message, this.roomId, this.isAvailable});

  CancelBookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    roomId = json['roomId'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['roomId'] = roomId;
    data['isAvailable'] = isAvailable;
    return data;
  }
}

