part of 'hotel_filter_cubit.dart';

@immutable
sealed class HotelFilterState {}

final class HotelFilterInitial extends HotelFilterState {}

final class HotelFilterLoading extends HotelFilterState {}

final class HotelFilterSuccess extends HotelFilterState {
  final List<SearchHotelByNameModel> hotelFilter;

  HotelFilterSuccess({required this.hotelFilter});
}

final class HotelFilterFailure extends HotelFilterState {
  final String message;
  HotelFilterFailure({required this.message});
}
