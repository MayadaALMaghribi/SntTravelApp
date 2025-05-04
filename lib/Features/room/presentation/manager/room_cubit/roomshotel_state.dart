import 'package:sntegpito/Features/room/data/models/hotel_rooms_model.dart';

class HotelRoomsByIdState {}

final class HotelRoomsByIdInitial extends HotelRoomsByIdState {}

final class HotelRoomsByIdLoading extends HotelRoomsByIdState {}

final class HotelRoomsByIdFailure extends HotelRoomsByIdState {
  final dynamic errmessage;

  HotelRoomsByIdFailure({required this.errmessage});
}

final class HotelRoomsByIdSuccess extends HotelRoomsByIdState {
  final List<HotelRoomsModel> hotelroomsmodel;

  HotelRoomsByIdSuccess({required this.hotelroomsmodel});
}
