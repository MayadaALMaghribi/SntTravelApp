import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/hotels/data/models/services_hotel_details_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'services_hotel_details_state.dart';

class ServicesHotelDetailsCubit extends Cubit<ServicesHotelDetailsState> {
  ServicesHotelDetailsCubit(this.apiConsumer)
      : super(ServicesHotelDetailsInitial());
  final ApiConsumer apiConsumer;
  List<ServicesHotelDetailsModel> serviceshotel = [];
  fetchserviceshotelDetails({required String hotelid}) async {
    try {
      emit(ServicesHotelDetailsLoading());
      final services =
          await apiConsumer.get("${EndPoint.serviceshotel}$hotelid");
      if (services == null) {
        emit(ServicesHotelDetailsFailure(errmessage: "No Services return"));
      } else {
        for (var data in services['data']) {
          serviceshotel.add(ServicesHotelDetailsModel.fromJson(data));
        }
        emit(ServicesHotelDetailsSucess(
            servicesHotelDetailsModel: serviceshotel));
      }
    } on ServerException catch (e) {
      emit(ServicesHotelDetailsFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
