import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../data/models/add_fav_models.dart';

part 'addfovurite_state.dart';

class AddfovuriteCubit extends Cubit<AddfovuriteState> {
  AddfovuriteCubit(this.apiConsumer) : super(AddfovuriteInitial());
  final ApiConsumer apiConsumer;
  AddFavouriteModel? addFavouriteModel;
  addfavourite({required int itemIdfav, required String itemTypefav,required int userIdfav}) async {
    try {
      emit(AddfovuriteLoading());
      final response = await apiConsumer.post(EndPoint.addfav, data: {
        ApiKey.userIdfav : userIdfav,
        ApiKey.itemIdfav : itemIdfav,
        ApiKey.itemTypefav : itemTypefav
      });
      addFavouriteModel =
          AddFavouriteModel.fromJson(response as Map<String, dynamic>);
      emit(AddfovuriteSucess(sucessmessage: addFavouriteModel!.message.toString())); 
    } on ServerException catch (e) {
      emit(AddfovuriteFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
