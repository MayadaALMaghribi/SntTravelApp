part of 'get_all_activity_cart_cubit.dart';

@immutable
sealed class GetAllActivityCartState {}

final class GetAllActivityCartInitial extends GetAllActivityCartState {}

final class GetAllActivityCartLoading extends GetAllActivityCartState {}

final class GetAllActivityCartSuccess extends GetAllActivityCartState {
  final List<AllActivityCartModel> allactivitycartmodel;

  GetAllActivityCartSuccess({required this.allactivitycartmodel});
}

final class GetAllActivityCartFailure extends GetAllActivityCartState {
  final dynamic errmessage;

  GetAllActivityCartFailure({required this.errmessage});
}
