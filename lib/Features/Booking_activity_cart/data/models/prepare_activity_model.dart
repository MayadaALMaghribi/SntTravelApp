class PrepareActivityBookingModel {
  int? statusCode;
  String? message;
  int? bookingId;
  bool? hasRoom;

  PrepareActivityBookingModel(
      {this.statusCode, this.message, this.bookingId, this.hasRoom});

  PrepareActivityBookingModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    bookingId = json['bookingId'];
    hasRoom = json['hasRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['bookingId'] = bookingId;
    data['hasRoom'] = hasRoom;
    return data;
  }
}
