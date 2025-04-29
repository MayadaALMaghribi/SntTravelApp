class DetailsBookingBeforePaymentModel {
  String? message;
  BookingDetails? bookingDetails;

  DetailsBookingBeforePaymentModel({this.message, this.bookingDetails});

  DetailsBookingBeforePaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    bookingDetails = json['bookingDetails'] != null
        ? new BookingDetails.fromJson(json['bookingDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.bookingDetails != null) {
      data['bookingDetails'] = this.bookingDetails!.toJson();
    }
    return data;
  }
}

class BookingDetails {
  int? bookingId;
  Room? room;
  String? startDate;
  String? endDate;
  int? totalPrice;
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
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    paymentStatus = json['paymentStatus'];
    numberOfGuests = json['numberOfGuests'];
    bookingStatus = json['bookingStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['totalPrice'] = this.totalPrice;
    data['paymentStatus'] = this.paymentStatus;
    data['numberOfGuests'] = this.numberOfGuests;
    data['bookingStatus'] = this.bookingStatus;
    return data;
  }
}

class Room {
  int? roomNumber;
  String? roomType;
  int? pricePerNight;

  Room({this.roomNumber, this.roomType, this.pricePerNight});

  Room.fromJson(Map<String, dynamic> json) {
    roomNumber = json['roomNumber'];
    roomType = json['roomType'];
    pricePerNight = json['pricePerNight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomNumber'] = this.roomNumber;
    data['roomType'] = this.roomType;
    data['pricePerNight'] = this.pricePerNight;
    return data;
  }
}
