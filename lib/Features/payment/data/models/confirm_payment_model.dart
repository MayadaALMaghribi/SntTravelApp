class ConfirmPaymentModel {
  String? message;
  int? bookingId;
  String? paymentStatus;

  ConfirmPaymentModel({this.message, this.bookingId, this.paymentStatus});

  ConfirmPaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    bookingId = json['bookingId'];
    paymentStatus = json['paymentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['bookingId'] = bookingId;
    data['paymentStatus'] = paymentStatus;
    return data;
  }
}
