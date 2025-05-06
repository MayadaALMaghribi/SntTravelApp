part of 'add_cart_cubit.dart';

@immutable
sealed class AddCartState {}

final class AddCartInitial extends AddCartState {}

final class AddCartLoading extends AddCartState {}

final class AddCartSuccess extends AddCartState {
  final String successmessage;

  AddCartSuccess({required this.successmessage});
}

final class AddCartFailure extends AddCartState {
  final String errmessage;

  AddCartFailure({required this.errmessage});
}

final class RemoveCartLoading extends AddCartState {}

final class RemoveCartSuccess extends AddCartState {
  final ErrorModel errorModel;

  RemoveCartSuccess({required this.errorModel});
}

final class RemoveCartFailure extends AddCartState {
  final ErrorModel errorModel;

  RemoveCartFailure({required this.errorModel});
}