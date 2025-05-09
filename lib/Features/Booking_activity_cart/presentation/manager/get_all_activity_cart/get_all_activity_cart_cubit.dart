import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/all_activity_cart_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'get_all_activity_cart_state.dart';

class GetAllActivityCartCubit extends Cubit<GetAllActivityCartState> {
  GetAllActivityCartCubit(this.apiConsumer)
      : super(GetAllActivityCartInitial());
  final ApiConsumer apiConsumer;
  List<AllActivityCartModel> allActivityCartModel = [];
  fetchAllActivityCart() async {
    try {
      emit(GetAllActivityCartLoading());
      final response = await apiConsumer
          .get(EndPoint.getAllActivityCart + Constants.userid.toString());
      if (response == null) {
        emit(GetAllActivityCartFailure(errmessage: "response are null"));
      } else {
        allActivityCartModel = (response as List)
            .map((e) => AllActivityCartModel.fromJson(e))
            .toList();
        emit(GetAllActivityCartSuccess(
            allactivitycartmodel: allActivityCartModel));
      }
    } on ServerException catch (e) {
      emit(GetAllActivityCartFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
