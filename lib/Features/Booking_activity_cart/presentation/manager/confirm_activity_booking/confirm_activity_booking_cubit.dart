import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/error_model.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'confirm_activity_booking_state.dart';

class ConfirmActivityBookingCubit extends Cubit<ConfirmActivityBookingState> {
  ConfirmActivityBookingCubit(this.apiConsumer)
      : super(ConfirmActivityBookingInitial());
  final ApiConsumer apiConsumer;
  ErrorModel? model;
  confirmBooking({
    required BuildContext context,
    required int userid,
    required List<Map<String, dynamic>> activities,
  }) async {
    try {
      emit(ConfirmActivityBookingLoading());
      final response = await apiConsumer.post(EndPoint.confirmmActivityBooking,
          queryParameters: {
            ApiKey.userId: userid,
          },
          data: activities,
          isFromData: false);
      model = ErrorModel.fromJson(response);
      emit(ConfirmActivityBookingSuccess(message: model!.errorMessage));
       context.read<GetAllActivityCartCubit>().fetchAllActivityCart();
    } on ServerException catch (e) {
      emit(ConfirmActivityBookingFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
