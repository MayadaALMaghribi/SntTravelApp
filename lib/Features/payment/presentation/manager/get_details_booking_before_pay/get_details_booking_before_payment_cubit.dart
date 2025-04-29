import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/payment/data/details_booking_before_payment.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

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
          CacheHelper().getData(key: Constants.bookingId));

      if (detailsBookingBeforePaymentModel == null) {
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
