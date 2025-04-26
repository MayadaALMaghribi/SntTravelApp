import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/error_model.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'removefav_state.dart';

class RemovefavCubit extends Cubit<RemovefavState> {
  RemovefavCubit(this.apiConsumer) : super(RemovefavInitial());
  final ApiConsumer apiConsumer;
  ErrorModel? errorModel;
  RemoveFav(
      {required int itemIdfav,
      required int userIdfav,
      required String itemTypefav}) async {
    try {
      emit(RemovefavLoading());
      final response = await apiConsumer.delete(EndPoint.removefav, data: {
        ApiKey.itemIdfav: itemIdfav,
        ApiKey.userIdfav: userIdfav,
        ApiKey.itemTypefav: itemTypefav,
      });
      if (response == null) {
        emit(RemovefavFailure(errorMessage: "No Response return"));
        return;
      } else if (response != Map<String, dynamic>) {
        emit(RemovefavFailure(
            errorMessage: "Response no subType of String&dynamic"));
      } else {
        errorModel = ErrorModel.fromJson(response);
        emit(RemovefavSucess(errorModel: errorModel!));
      }
    } on ServerException catch (e) {
      emit(RemovefavFailure(errorMessage: e.errModel.errorMessage));
    }
  }
}
