import 'package:sntegpito/Features/Home/data/model/tourism_type_model.dart';

class TourismTypeState {}

final class TourismTypeInitial extends TourismTypeState {}

final class TourismTypeLoading extends TourismTypeState {}

final class TourismTypeSuccess extends TourismTypeState {
  final List<TourismTypeModel> tourismTypes;
  TourismTypeSuccess({required this.tourismTypes});
}

final class TourismTypeFailure extends TourismTypeState {
  final dynamic errmessage;
  TourismTypeFailure({required this.errmessage});
}
