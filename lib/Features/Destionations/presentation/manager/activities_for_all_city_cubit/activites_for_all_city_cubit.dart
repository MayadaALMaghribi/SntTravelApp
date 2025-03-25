import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/Destionations/data/models/activites_for_cities_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/cache/cache_helper.dart';

part 'activites_for_all_city_cubit_state.dart';

class ActivitesForAllCityCubit extends Cubit<ActivitesForAllCityCubitState> {
  ActivitesForAllCityCubit(this.apiConsumer)
      : super(ActivitesForAllCityCubitInitial());
  final ApiConsumer apiConsumer;
  List<ActivitesforcitiesModel> activitesforcitiesModel = [];
  fetchAllActivitesForCities() async {
    try {
      emit(ActivitesForAllCityCubitLoading());
      final response = await apiConsumer.get(
        EndPoint.getActivityByLocationId +
            CacheHelper().getData(key: "ID_Cached_City_Destination").toString(),
      );
      activitesforcitiesModel = (response as List)
          .map((e) => ActivitesforcitiesModel.fromJson(e))
          .toSet()
          .toList();
      emit(ActivitesForAllCityCubitSucess(
          activitesforcitiesModel: activitesforcitiesModel));
      print("idddd city :" +
          CacheHelper().getData(key: "ID_Cached_City_Destination").toString());
    } on ServerException catch (e) {
      emit(
          ActivitesForAllCityCubitFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
