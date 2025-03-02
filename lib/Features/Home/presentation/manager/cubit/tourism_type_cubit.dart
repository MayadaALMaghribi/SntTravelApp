import 'package:bloc/bloc.dart';
import 'package:sntegpito/Features/Home/data/model/tourism_type_model.dart';
import 'package:sntegpito/Features/Home/presentation/manager/cubit/tourism_type_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class TourismTypeCubit extends Cubit<TourismTypeState> {
  TourismTypeCubit(this.apiConsumer) : super(TourismTypeInitial());
  final ApiConsumer apiConsumer;
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
