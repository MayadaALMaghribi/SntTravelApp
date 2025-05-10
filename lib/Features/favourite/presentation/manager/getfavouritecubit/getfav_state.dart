part of 'getfav_cubit.dart';

@immutable
sealed class GetfavState {}

final class GetfavInitial extends GetfavState {}

final class GetfavLoading extends GetfavState {}

final class GetfavSucess extends GetfavState {
  final GetFavouriteModel get_fav_model;

  GetfavSucess({required this.get_fav_model});
}

final class GetfavFauiler extends GetfavState {
  final dynamic errmessage;
  GetfavFauiler({required this.errmessage});
}