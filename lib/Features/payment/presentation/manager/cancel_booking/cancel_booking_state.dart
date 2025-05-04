part of 'cancel_booking_cubit.dart';

@immutable
sealed class CancelBookingState {}

final class CancelBookingInitial extends CancelBookingState {}

final class CancelBookingLoading extends CancelBookingState {}

final class CancelBookingSuccess extends CancelBookingState {
 final CancelBookingModel cancelBookingModel;

  CancelBookingSuccess({required this.cancelBookingModel});

}

final class CancelBookingFailutre extends CancelBookingState {
  final String errMessage;

  CancelBookingFailutre({required this.errMessage});
}
