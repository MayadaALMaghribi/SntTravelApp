

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/profile/data/models/get_user_model.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class GetCubit extends Cubit<GetState> {
  GetCubit(this.apiConsumer) : super(GetStateIntial());
  final ApiConsumer apiConsumer;
  GetuserprofileModel? getmodel;

  getuserprofile() async {
    try {
      emit(GetuserprofileLoading());
      final response = await apiConsumer.get(
        EndPoint.getuserprofile,
      );
      getmodel = GetuserprofileModel.fromJson(response);
      CacheHelper().saveData(
          key: ApiKey.getprofilepicture, value: getmodel!.profilePicture);
      print(response.toString());
      emit(GetuserprofileSuccess(
          getuserprofileModel: GetuserprofileModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(GetuserprofileFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
