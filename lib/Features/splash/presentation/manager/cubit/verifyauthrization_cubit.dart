import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../data/models/valid_auth_to_app.dart';

part 'verifyauthrization_state.dart';

class VerifyauthrizationCubit extends Cubit<VerifyauthrizationState> {
  VerifyauthrizationCubit(this.apiConsumer)
      : super(VerifyauthrizationInitial());
  final ApiConsumer apiConsumer;
  ValidAuthtoApp? validAuthtoApp;
  validToken() async {
    try {
      emit(VerifyauthrizationLoading());
      final response = await apiConsumer.get(EndPoint.validateToken);
      if (response == null) {
        emit(VerifyauthrizationFailure(errmessage: "Response are Null"));
      } else {
        validAuthtoApp = ValidAuthtoApp.fromJson(response);

        emit(VerifyauthrizationSucess(validAuthtoApp: validAuthtoApp!));
      }
    } on ServerException catch (e) {
      emit(VerifyauthrizationFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
