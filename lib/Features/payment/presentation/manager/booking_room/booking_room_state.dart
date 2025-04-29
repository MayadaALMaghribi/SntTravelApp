part of 'booking_room_cubit.dart';

@immutable
sealed class BookingRoomState {}

final class BookingRoomInitial extends BookingRoomState {}

final class BookingRoomLoading extends BookingRoomState {}

final class BookingRoomSuccess extends BookingRoomState {
  final ResponseBookingRoomModel responseBookingRoomModel;

  BookingRoomSuccess({required this.responseBookingRoomModel});
}

final class BookingRoomFailure extends BookingRoomState {
  final dynamic errmessage;

  BookingRoomFailure({required this.errmessage});
}
