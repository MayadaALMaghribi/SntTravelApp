class ResponseBookingRoomModel {
  String? message;
  int? bookingId;
  String? transactionId;
  String? expiresAt;
  int? expiresInMinutes;

  ResponseBookingRoomModel(
      {this.message,
      this.bookingId,
      this.transactionId,
      this.expiresAt,
      this.expiresInMinutes});

  ResponseBookingRoomModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    bookingId = json['bookingId'];
    transactionId = json['transactionId'];
    expiresAt = json['expiresAt'];
    expiresInMinutes = json['expiresInMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['bookingId'] = this.bookingId;
    data['transactionId'] = this.transactionId;
    data['expiresAt'] = this.expiresAt;
    data['expiresInMinutes'] = this.expiresInMinutes;
    return data;
  }
}
