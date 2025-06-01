import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sntegpito/Features/entertainment/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/entertainment_cubit/entertainment_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/utils/constant.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.apiConsumer) : super(ImageDiscountInitial());
  final ApiConsumer apiConsumer;
  ImageDiscountTourismModel? imagemodel;

  getImageDiscount() async {
    try {
      emit(ImageDiscountLoading());
      final response = await apiConsumer.get(
        EndPoint.imagediscount,
        queryParameters: {
          ApiKey.id: CacheHelper().getData(key: Constants.tourism_id)
        },
      );
      log("image${CacheHelper().getData(key: Constants.tourism_id)}");
      imagemodel = ImageDiscountTourismModel.fromJson(response);
      emit(ImageDiscountSuccess(imagemodel: imagemodel!));
    } on ServerException catch (e) {
      emit(ImageDiscountFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
