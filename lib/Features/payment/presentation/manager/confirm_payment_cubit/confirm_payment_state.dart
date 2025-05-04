part of 'confirm_payment_cubit.dart';

@immutable
sealed class ConfirmPaymentState {}

final class ConfirmPaymentInitial extends ConfirmPaymentState {}

final class ConfirmPaymentloading extends ConfirmPaymentState {}

final class ConfirmPaymentSucess extends ConfirmPaymentState {
  final ConfirmPaymentModel confirmPaymentModel;

  ConfirmPaymentSucess({required this.confirmPaymentModel});
}

final class ConfirmPaymentFailure extends ConfirmPaymentState {
  final String errorMessage;

  ConfirmPaymentFailure({required this.errorMessage});
}
