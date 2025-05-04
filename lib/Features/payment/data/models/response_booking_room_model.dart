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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['bookingId'] = bookingId;
    data['transactionId'] = transactionId;
    data['expiresAt'] = expiresAt;
    data['expiresInMinutes'] = expiresInMinutes;
    return data;
  }
}
