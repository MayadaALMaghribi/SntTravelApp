part of 'get_activity_for_booking_cubit.dart';

@immutable
sealed class GetActivityForBookingState {}

final class GetActivityForBookingInitial extends GetActivityForBookingState {}

final class GetActivityForBookingLoading extends GetActivityForBookingState {}

final class GetActivityForBookingFailure extends GetActivityForBookingState {
  final dynamic errmessage;

  GetActivityForBookingFailure({required this.errmessage});
}

final class GetActivityForBookingSuccess extends GetActivityForBookingState {
 final GetActivityForBookingModel getActivityForBookingModel;

  GetActivityForBookingSuccess({required this.getActivityForBookingModel});
}
