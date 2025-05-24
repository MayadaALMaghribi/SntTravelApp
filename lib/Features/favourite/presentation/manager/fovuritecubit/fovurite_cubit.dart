import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/getfavouritecubit/getfav_cubit.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../data/models/add_fav_models.dart';

part 'fovurite_state.dart';

class FovuriteCubit extends Cubit<AddfovuriteState> {
  FovuriteCubit(this.apiConsumer) : super(AddfovuriteInitial());
  final ApiConsumer apiConsumer;
  AddFavouriteModel? addFavouriteModel;
  ErrorModel? errorModel;
  addfavourite(
      {required int itemIdfav,
      required String itemTypefav,
      required int userIdfav,
      required BuildContext context}) async {
    try {
      emit(AddfovuriteLoading());
      final response =
          await apiConsumer.post(EndPoint.addfav, isFromData: false, data: {
        ApiKey.userId: userIdfav,
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
        addFavouriteModel = AddFavouriteModel.fromJson(response);
        emit(AddfovuriteSucess(
            sucessmessage: addFavouriteModel!.message.toString()));
        context.read<GetfavCubit>().fetchGetFav();
      }
    } on ServerException catch (e) {
      print("ERORR${e.errModel.errorMessage}");
      emit(AddfovuriteFailure(errmessage: e.errModel.errorMessage));
    }
  }

  //Remove
  RemoveFav(
      {required int itemIdfav,
      required int userIdfav,
      required String itemTypefav,
      required BuildContext context}) async {
    try {
      emit(RemovefavLoading());
      final response = await apiConsumer.delete(EndPoint.removefav, data: {
        ApiKey.itemIdfav: itemIdfav,
        ApiKey.userId: userIdfav,
        ApiKey.itemTypefav: itemTypefav,
      });
      if (response == null) {
        emit(RemovefavFailure(errorModel: errorModel!));
        return;
      } else {
        errorModel = ErrorModel.fromJson(response);
        emit(RemovefavSucess(errorModel: errorModel!));
        context.read<GetfavCubit>().fetchGetFav();
      }
    } on ServerException {
      emit(RemovefavFailure(errorModel: errorModel!));
    }
  }
}

//AuthModel.fromJson(response)
