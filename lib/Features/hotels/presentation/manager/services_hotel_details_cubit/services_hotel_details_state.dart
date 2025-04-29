part of 'services_hotel_details_cubit.dart';

@immutable
sealed class ServicesHotelDetailsState {}

final class ServicesHotelDetailsInitial extends ServicesHotelDetailsState {}

final class ServicesHotelDetailsLoading extends ServicesHotelDetailsState {}

final class ServicesHotelDetailsSucess extends ServicesHotelDetailsState {
  final List<ServicesHotelDetailsModel> servicesHotelDetailsModel;

  ServicesHotelDetailsSucess({required this.servicesHotelDetailsModel});
}

final class ServicesHotelDetailsFailure extends ServicesHotelDetailsState {
  final dynamic errmessage;

  ServicesHotelDetailsFailure({required this.errmessage});
}
