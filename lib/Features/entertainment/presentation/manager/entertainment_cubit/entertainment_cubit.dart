import 'package:bloc/bloc.dart';
import 'package:sntegpito/Features/entertainment/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/entertainment_cubit/entertainment_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.apiConsumer) : super(ImageDiscountInitial());
  final ApiConsumer apiConsumer;
  ImageDiscountTourismModel? imagemodel;
  int? cachedId = CacheHelper().getData(key: 'selected_tourism_id');

  getImageDiscount() async {
    try {
      emit(ImageDiscountLoading());
      final response = await apiConsumer.get(
        EndPoint.imagediscount,
        queryParameters: {ApiKey.id: cachedId},
      );
      imagemodel = ImageDiscountTourismModel.fromJson(response);
      emit(ImageDiscountSuccess(imagemodel: imagemodel!));
    } on ServerException catch (e) {
      emit(ImageDiscountFailure(errmessage: e.errModel.errorMessage));
    }
  }
}

// verifyy() async {
//     try {
//       emit(VerifyLoading());
//       final response = await apiConsumer.post(EndPoint.verify,
//           isFromData: false,
//           queryParameters: {ApiKey.code: codeController.text});
//       verify = AuthModel.fromJson(response);
//       emit(VerifySuccess(message: verify!.message));
//       //print(response);
//     } on ServerException catch (e) {
//       emit(VerifyFailure(errmessage: e.errModel.errorMessage));
//     }
//   }
