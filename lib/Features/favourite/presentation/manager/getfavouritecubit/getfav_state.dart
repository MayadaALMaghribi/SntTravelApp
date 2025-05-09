part of 'getfav_cubit.dart';

@immutable
sealed class GetfavState {}

final class GetfavInitial extends GetfavState {}

final class GetfavLoading extends GetfavState {}

final class GetfavSucess extends GetfavState {
  final List<GetFavouriteModel> getfavmodel;

  GetfavSucess({required this.getfavmodel});
}

final class GetfavFauiler extends GetfavState {
  final dynamic errmessage;
  GetfavFauiler({required this.errmessage});
}
