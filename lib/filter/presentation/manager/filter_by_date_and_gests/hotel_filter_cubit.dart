import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';
import 'package:sntegpito/Features/hotels/data/models/search_hotel_by_name_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class HotelFilterCubit extends Cubit<HotelFilterState> {
  HotelFilterCubit(this.apiConsumer) : super(HotelFilterInitial());

  final ApiConsumer apiConsumer;

  TextEditingController startDateText = TextEditingController();
  TextEditingController endDateText = TextEditingController();
  TextEditingController roomsText = TextEditingController();
  TextEditingController guestsText = TextEditingController();
  List<SearchHotelByNameModel> filterHotel = [];

  int? selectedRating;
  double? minPrice;
  double? maxPrice;

  void updateRating(int rating) {
    selectedRating = rating;
  }

  void updatePriceRange(double min, double max) {
    minPrice = min;
    maxPrice = max;
  }

  Future<void> filterHotelsByDate() async {
    try {
      emit(HotelFilterLoading());

      final Map<String, dynamic> queryParams = {};

      if (startDateText.text.isNotEmpty) {
        queryParams[ApiKey.startDateFilter] = startDateText.text;
      }
      if (endDateText.text.isNotEmpty) {
        queryParams[ApiKey.endDateFilter] = endDateText.text;
      }
      if (roomsText.text.isNotEmpty) {
        queryParams[ApiKey.roomsRequiredFilter] = roomsText.text;
      }
      if (guestsText.text.isNotEmpty) {
        queryParams[ApiKey.guestsFilter] = guestsText.text;
      }
      if (minPrice != null) {
        queryParams[ApiKey.minPriceFilter] = minPrice.toString();
      }
      if (maxPrice != null) {
        queryParams[ApiKey.maxPriceFilter] = maxPrice.toString();
      }
      if (selectedRating != null) {
        queryParams[ApiKey.minStarsFilter] = selectedRating.toString();
      }

      final response = await apiConsumer.get(
        EndPoint.hotelFilter,
        queryParameters: queryParams,
      );

      filterHotel.clear();
      for (var item in response["data"]) {
        filterHotel.add(SearchHotelByNameModel.fromJson(item));
      }

      emit(HotelFilterSuccess(hotelFilter: filterHotel));
    } on ServerException catch (e) {
      emit(HotelFilterFailure(message: e.errModel.errorMessage));
    }
  }
}
