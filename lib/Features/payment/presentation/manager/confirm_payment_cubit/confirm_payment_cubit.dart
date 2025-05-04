import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../data/models/confirm_payment_model.dart';

part 'confirm_payment_state.dart';

class ConfirmPaymentCubit extends Cubit<ConfirmPaymentState> {
  ConfirmPaymentCubit(this.apiConsumer) : super(ConfirmPaymentInitial());
  final ApiConsumer apiConsumer;
  ConfirmPaymentModel? confirmPaymentModel;
  verifyconfirmpayment() async {
    try {
      emit(ConfirmPaymentloading());
      final response = await apiConsumer
          .post(EndPoint.confirmpayment + Constants.transcationId.toString());
      if (response == null) {
        emit(ConfirmPaymentFailure(errorMessage: "Response are Null Data"));
      } else {
        confirmPaymentModel = ConfirmPaymentModel.fromJson(response);
        emit(ConfirmPaymentSucess(confirmPaymentModel: confirmPaymentModel!));
      }
    } on ServerException catch (e) {
      emit(ConfirmPaymentFailure(errorMessage: e.errModel.errorMessage));
    }
  }
}
