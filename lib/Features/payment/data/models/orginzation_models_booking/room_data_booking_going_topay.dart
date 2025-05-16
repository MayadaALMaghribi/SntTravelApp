import 'package:sntegpito/Features/payment/data/models/orginzation_models_booking/base_abstract_booking_data.dart';

class RoomBookingData implements BaseBookingData {
  final String roomname;
  final double price;

  RoomBookingData({required this.roomname, required this.price});

  @override
  double get totalPrice => price;

  @override
  String get name => roomname;

  @override
  String get type => "room";
}
