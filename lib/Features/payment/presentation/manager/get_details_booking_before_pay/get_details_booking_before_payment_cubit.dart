import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/payment/data/models/details_booking_before_payment_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/utils/constant.dart';

part 'get_details_booking_before_payment_state.dart';

class GetDetailsBookingBeforePaymentCubit
    extends Cubit<GetDetailsBookingBeforePaymentState> {
  GetDetailsBookingBeforePaymentCubit(this.apiConsumer)
      : super(GetDetailsBookingBeforePaymentInitial());
  final ApiConsumer apiConsumer;
  DetailsBookingBeforePaymentModel? detailsBookingBeforePaymentModel;

  getDetailsBooking() async {
    try {
      emit(GetDetailsBookingBeforePaymentLoading());
      final response = await apiConsumer.get(EndPoint.getDetailsBookingBefore +
          CacheHelper().getData(key: Constants.bookingId).toString());

      if (response == null) {
        emit(GetDetailsBookingBeforePaymentFailure(
            errmessage: "Response is null"));
      } else {
        detailsBookingBeforePaymentModel =
            DetailsBookingBeforePaymentModel.fromJson(response);
        emit(
          GetDetailsBookingBeforePaymentSuccess(
              detailsBookingBeforePaymentModel:
                  detailsBookingBeforePaymentModel!),
        );
      }
    } on ServerException catch (e) {
      emit(
        GetDetailsBookingBeforePaymentFailure(
            errmessage: e.errModel.errorMessage),
      );
    }
  }
}
