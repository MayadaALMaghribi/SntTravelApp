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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['roomId'] = this.roomId;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

