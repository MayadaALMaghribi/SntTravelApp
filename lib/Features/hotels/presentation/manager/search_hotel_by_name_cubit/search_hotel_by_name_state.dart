part of 'search_hotel_by_name_cubit.dart';

@immutable
sealed class SearchHotelByNameState {}

final class SearchHotelByNameInitial extends SearchHotelByNameState {}

final class SearchHotelByNameLoading extends SearchHotelByNameState {}

final class SearchHotelByNameFailure extends SearchHotelByNameState {
  final dynamic errmessage;

  SearchHotelByNameFailure({required this.errmessage});
}

final class SearchHotelByNameSucess extends SearchHotelByNameState {
  final List<SearchHotelByNameModel> searchHotelByNameModel;

  SearchHotelByNameSucess({required this.searchHotelByNameModel});
}
