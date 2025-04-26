import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../data/models/add_fav_models.dart';

part 'addfovurite_state.dart';

class AddfovuriteCubit extends Cubit<AddfovuriteState> {
  AddfovuriteCubit(this.apiConsumer) : super(AddfovuriteInitial());
  final ApiConsumer apiConsumer;
  AddFavouriteModel? addFavouriteModel;
  ErrorModel? errorModel;
  addfavourite(
      {required int itemIdfav,
      required String itemTypefav,
      required int userIdfav}) async {
    try {
      emit(AddfovuriteLoading());
      final response =
          await apiConsumer.post(EndPoint.addfav, isFromData: false, data: {
        ApiKey.userIdfav: userIdfav,
        ApiKey.itemIdfav: itemIdfav,
        ApiKey.itemTypefav: itemTypefav
      });
      if (response == null) {
        emit(AddfovuriteFailure(errmessage: "response are NUll"));
      } else if (response is! Map<String, dynamic>) {
        emit(AddfovuriteFailure(
            errmessage: "Unexpected data format from the server"));
        return;
      } else {
        addFavouriteModel =
            AddFavouriteModel.fromJson(response as Map<String, dynamic>);
        emit(AddfovuriteSucess(
            sucessmessage: addFavouriteModel!.message.toString()));
      }
    } on ServerException catch (e) {
      print("ERORR" + e.errModel.errorMessage);
      emit(AddfovuriteFailure(errmessage: e.errModel.errorMessage));
    }
  }

  //Remove
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
        emit(RemovefavFailure(errorModel: errorModel!));
        return;
      } else {
        errorModel = ErrorModel.fromJson(response);
        emit(RemovefavSucess(errorModel: errorModel!));
      }
    } on ServerException catch (e) {
      emit(RemovefavFailure(errorModel: errorModel!));
    }
  }
}
//AuthModel.fromJson(response)
