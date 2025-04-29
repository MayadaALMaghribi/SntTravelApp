import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/payment/data/response_booking_room_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'booking_room_state.dart';

class BookingRoomCubit extends Cubit<BookingRoomState> {
  BookingRoomCubit(this.apiConsumer) : super(BookingRoomInitial());
  final ApiConsumer apiConsumer;
  ResponseBookingRoomModel? responseBookingRoomModel;
  bookingRoom(
      {required String startdate,
      required String enddate,
      required int userid,
      required int roomid,
      required int paymethod,
      required int numofguest}) async {
    try {
      emit(BookingRoomLoading());
      final response = await apiConsumer.post(EndPoint.bookingroom, data: {
        ApiKey.roomid: roomid,
        ApiKey.userId: userid,
        ApiKey.startDateFilter: startdate,
        ApiKey.endDateFilter: enddate,
        ApiKey.numberofguests: numofguest,
        ApiKey.paymentmethod: paymethod,
      });
      if (response == null) {
        emit(BookingRoomFailure(errmessage: "Response is null"));
      } else {
        responseBookingRoomModel = ResponseBookingRoomModel.fromJson(response);
        emit(BookingRoomSuccess(
            responseBookingRoomModel: responseBookingRoomModel!));
      }
    } on ServerException catch (e) {
      emit(BookingRoomFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
