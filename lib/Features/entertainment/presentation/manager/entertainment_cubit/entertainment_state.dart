import 'package:sntegpito/Features/entertainment/data/models/image_discount_tourism_model.dart';

class EntertainmentState {}

final class ImageDiscountInitial extends EntertainmentState {}

final class ImageDiscountLoading extends EntertainmentState {}

final class ImageDiscountSuccess extends EntertainmentState {
  final ImageDiscountTourismModel imagemodel;

  ImageDiscountSuccess({required this.imagemodel});
}

final class ImageDiscountFailure extends EntertainmentState {
  final dynamic errmessage;

  ImageDiscountFailure({required this.errmessage});
}
