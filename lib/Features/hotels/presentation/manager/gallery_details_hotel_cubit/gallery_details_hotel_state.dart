part of 'gallery_details_hotel_cubit.dart';

@immutable
sealed class GalleryDetailsHotelState {}

final class GalleryDetailsHotelInitial extends GalleryDetailsHotelState {}

final class GalleryDetailsHoteloading extends GalleryDetailsHotelState {}

final class GalleryDetailsHotelSucess extends GalleryDetailsHotelState {
  final List<GalleryDetailsHotelModel> gallarydetailshotel;

  GalleryDetailsHotelSucess({required this.gallarydetailshotel});
}

final class GalleryDetailsHotelFailure extends GalleryDetailsHotelState {
  final dynamic errmessage;

  GalleryDetailsHotelFailure({required this.errmessage});
}
