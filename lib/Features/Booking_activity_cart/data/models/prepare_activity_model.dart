class PrepareActivityBookingModel{
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['bookingId'] = this.bookingId;
    data['hasRoom'] = this.hasRoom;
    return data;
  }
}
