import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/payment/data/cancel_booking_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';

part 'cancel_booking_state.dart';

class CancelBookingCubit extends Cubit<CancelBookingState> {
  CancelBookingCubit(this.apiConsumer) : super(CancelBookingInitial());
  final ApiConsumer apiConsumer;
  CancelBookingModel ?cancelBookingModel;
  cancelBooking()async{
    
  }
}
