
 import 'package:sntegpito/Features/entertainment/data/models/image_discount_tourism_model.dart';

class MedicalState {}

final class MedicalImageDiscountInitial extends MedicalState {}

final class MedicalImageDiscountLoading extends MedicalState {}

final class MedicalImageDiscountSuccess extends MedicalState {
  final ImageDiscountTourismModel imagemodel;

  MedicalImageDiscountSuccess({required this.imagemodel});
}

final class MedicalImageDiscountFailure extends MedicalState {
  final dynamic errmessage;

  MedicalImageDiscountFailure({required this.errmessage});
}
