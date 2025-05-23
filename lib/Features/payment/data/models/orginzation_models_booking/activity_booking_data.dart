import 'package:sntegpito/Features/payment/data/models/orginzation_models_booking/base_abstract_booking_data.dart';

class ActivityBookingData implements BaseBookingData {
  final String activityname;
  final double price;

  ActivityBookingData({required this.activityname, required this.price});

  @override
  double get totalPrice => price;

  @override
  String get name => activityname;

  @override
  String get type => "activity";
}
