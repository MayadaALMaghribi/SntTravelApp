import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/prepare_activity_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'prepare_activity_before_booking_state.dart';

class PrepareActivityBeforeBookingCubit
    extends Cubit<PrepareActivityBeforeBookingState> {
  PrepareActivityBeforeBookingCubit(this.apiConsumer)
      : super(PrepareActivityBeforeBookingInitial());
  final ApiConsumer apiConsumer;
  PrepareActivityBookingModel? prepareActivityBookingModel;

  prepare({required int userId}) async {
    try {
      emit(PrepareActivityBeforeBookingLoading());
      final response = await apiConsumer
          .post(EndPoint.prepareActivityBooking, queryParameters: {
        ApiKey.userId: userId,
      });
      prepareActivityBookingModel =
          PrepareActivityBookingModel.fromJson(response);
      emit(PrepareActivityBeforeBookingSuccess(
          prepareActivityBookingModel: prepareActivityBookingModel!));
    } on ServerException catch (e) {
      emit(PrepareActivityBeforeBookingFailure(
          errmessage: e.errModel.errorMessage));
    }
  }
}
