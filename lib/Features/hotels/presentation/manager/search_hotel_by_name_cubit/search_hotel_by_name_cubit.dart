import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/hotels/data/models/search_hotel_by_name_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/api/end_ponits.dart';

part 'search_hotel_by_name_state.dart';

class SearchHotelByNameCubit extends Cubit<SearchHotelByNameState> {
  SearchHotelByNameCubit(this.apiConsumer) : super(SearchHotelByNameInitial());
  final ApiConsumer apiConsumer;
  List<SearchHotelByNameModel> searchHotelByNameModel = [];
  fetchHotelsByName({required String cityName}) async {
    try {
      emit(SearchHotelByNameLoading());
      searchHotelByNameModel.clear();
      final response =
          await apiConsumer.get(EndPoint.getHotelsByLocationName + cityName);
      for (var item in response["data"]) {
        //books.add(BookModel.fromJson(item));
        searchHotelByNameModel.add(SearchHotelByNameModel.fromJson(item));
        emit(SearchHotelByNameSucess(
            searchHotelByNameModel: searchHotelByNameModel));
      }
    } on ServerException catch (e) {
      emit(SearchHotelByNameFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
