class DetailsBookingBeforePaymentModel {
  String? message;
  BookingDetails? bookingDetails;

  DetailsBookingBeforePaymentModel({this.message, this.bookingDetails});

  DetailsBookingBeforePaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    bookingDetails = json['bookingDetails'] != null
        ? BookingDetails.fromJson(json['bookingDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (bookingDetails != null) {
      data['bookingDetails'] = bookingDetails!.toJson();
    }
    return data;
  }
}

class BookingDetails {
  int? bookingId;
  Room? room;
  String? startDate;
  String? endDate;
  double? totalPrice;
  String? paymentStatus;
  int? numberOfGuests;
  String? bookingStatus;

  BookingDetails(
      {this.bookingId,
      this.room,
      this.startDate,
      this.endDate,
      this.totalPrice,
      this.paymentStatus,
      this.numberOfGuests,
      this.bookingStatus});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    paymentStatus = json['paymentStatus'];
    numberOfGuests = json['numberOfGuests'];
    bookingStatus = json['bookingStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookingId'] = bookingId;
    if (room != null) {
      data['room'] = room!.toJson();
    }
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalPrice'] = totalPrice;
    data['paymentStatus'] = paymentStatus;
    data['numberOfGuests'] = numberOfGuests;
    data['bookingStatus'] = bookingStatus;
    return data;
  }
}

class Room {
  int? roomNumber;
  String? roomType;
  double? pricePerNight;

  Room({this.roomNumber, this.roomType, this.pricePerNight});

  Room.fromJson(Map<String, dynamic> json) {
    roomNumber = json['roomNumber'];
    roomType = json['roomType'];
    pricePerNight = json['pricePerNight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomNumber'] = roomNumber;
    data['roomType'] = roomType;
    data['pricePerNight'] = pricePerNight;
    return data;
  }
}
