import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/payment/data/models/cancel_booking_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/utils/constant.dart';

part 'cancel_booking_state.dart';

class CancelBookingCubit extends Cubit<CancelBookingState> {
  CancelBookingCubit(this.apiConsumer) : super(CancelBookingInitial());
  final ApiConsumer apiConsumer;
  CancelBookingModel? cancelBookingModel;
  cancelBooking() async {
    try {
      emit(CancelBookingLoading());
      final response = await apiConsumer.delete(EndPoint.cancelbooking +
          CacheHelper().getData(key: Constants.bookingId).toString());
      if (response == null) {
        emit(CancelBookingFailutre(errMessage: "response is null"));
      } else {
        cancelBookingModel = CancelBookingModel.fromJson(response);
        emit(CancelBookingSuccess(cancelBookingModel: cancelBookingModel!));
      }
    } on ServerException catch (e) {
      emit(CancelBookingFailutre(errMessage: e.errModel.errorMessage));
    }
  }
}
