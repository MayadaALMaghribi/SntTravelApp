import 'package:bloc/bloc.dart';
import 'package:sntegpito/Features/entertainment/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/Features/medical/presentation/manager/medical_cubit/medical_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class MedicalCubit extends Cubit<MedicalState> {
  MedicalCubit(this.apiConsumer) : super(MedicalImageDiscountInitial());
  final ApiConsumer apiConsumer;
  ImageDiscountTourismModel? imagemodel;
  int? cachedId = CacheHelper().getData(key: 'selected_tourism_id');

  getImageDiscounttop() async {
    try {
      emit(MedicalImageDiscountLoading());
      final response = await apiConsumer.get(
        EndPoint.imagediscount,
        queryParameters: {ApiKey.id: cachedId},
      );
      imagemodel = ImageDiscountTourismModel.fromJson(response);
      emit(MedicalImageDiscountSuccess(imagemodel: imagemodel!));
    } on ServerException catch (e) {
      emit(MedicalImageDiscountFailure(errmessage: e.errModel.errorMessage));
    }
  }
}