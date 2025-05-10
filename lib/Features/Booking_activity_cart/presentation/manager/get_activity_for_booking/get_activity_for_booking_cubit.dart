import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/get_activity_for_booking_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'get_activity_for_booking_state.dart';

class GetActivityForBookingCubit extends Cubit<GetActivityForBookingState> {
  GetActivityForBookingCubit(this.apiConsumer)
      : super(GetActivityForBookingInitial());
  final ApiConsumer apiConsumer;
  GetActivityForBookingModel? getActivityForBookingModel;

  getActivityBooking({required int userid}) async {
    try {
      emit(GetActivityForBookingLoading());
      final response = await apiConsumer
          .get(EndPoint.getactivityForBooking, queryParameters: {
        ApiKey.userId: userid,
      });
      if (response == null) {
        emit(GetActivityForBookingFailure(errmessage: 'response is null'));
      } else if (response is! Map<String, dynamic>) {
        emit(GetActivityForBookingFailure(
            errmessage: "Unexpected data format from the server"));
        return;
      } else {
        getActivityForBookingModel =
            GetActivityForBookingModel.fromJson(response);
        emit(GetActivityForBookingSuccess(
            getActivityForBookingModel: getActivityForBookingModel!));
      }
    } on ServerException catch (e) {
      emit(GetActivityForBookingFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
