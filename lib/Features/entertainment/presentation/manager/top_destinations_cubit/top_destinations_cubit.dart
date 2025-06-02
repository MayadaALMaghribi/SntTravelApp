import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';
import '../../../data/models/top_destinations_model.dart';

part 'top_destinations_state.dart';

class TopDestinationsCubit extends Cubit<TopDestinationsState> {
  TopDestinationsCubit(this.apiConsumer) : super(TopDestinationsInitial());
  final ApiConsumer apiConsumer;
  List<TopDestinationModel> topDestination = [];
  fetchTopDestinations() async {
    try {
      emit(TopDestinationsLoading());
      final response = await apiConsumer.get(
          EndPoint.getAllLocationsByTourismTypeID +
              CacheHelper().getData(key: Constants.tourism_id).toString());
      log("topdestionation${CacheHelper().getData(key: Constants.tourism_id)}");
      topDestination = (response as List)
          .map((e) => TopDestinationModel.fromJson(e))
          .toSet()
          .toList();
      emit(TopDestinationsSucess(topDestinationModel: topDestination));
    } on ServerException catch (e) {
      emit(TopDestinationsFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
/**
 * final ApiConsumer apiConsumer;
  List<TourismTypeModel> tourismTypes = [];

   getTourismType() async {
    try {
      emit(TourismTypeLoading());
      final response = await apiConsumer.get(
        EndPoint.tourismtype,
      );

      tourismTypes = (response as List)
          .map((e) => TourismTypeModel.fromJson(e))
          .toSet()
          .toList();
      emit(TourismTypeSuccess(tourismTypes: tourismTypes));
    } on ServerException catch (e) {
      emit(TourismTypeFailure(errmessage: e.errModel.errorMessage));
    }
  }
}

 */