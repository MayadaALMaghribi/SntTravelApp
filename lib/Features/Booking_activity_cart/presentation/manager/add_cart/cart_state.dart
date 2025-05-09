part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class AddCartInitial extends CartState {}

final class AddCartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final String successmessage;

  AddCartSuccess({required this.successmessage});
}

final class AddCartFailure extends CartState {
  final String errmessage;

  AddCartFailure({required this.errmessage});
}

final class RemoveCartLoading extends CartState {}

final class RemoveCartSuccess extends CartState {
  final ErrorModel errorModel;

  RemoveCartSuccess({required this.errorModel});
}

final class RemoveCartFailure extends CartState {
  final ErrorModel errorModel;

  RemoveCartFailure({required this.errorModel});
}
