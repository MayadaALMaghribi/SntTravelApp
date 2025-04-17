import 'package:bloc/bloc.dart';
import 'package:sntegpito/Features/hotels/data/models/hotel_rooms_model.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/room_cubit/roomshotel_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class RoomsHotelCubit extends Cubit<HotelRoomsByIdState> {
  RoomsHotelCubit(this.apiConsumer) : super(HotelRoomsByIdInitial());
  final ApiConsumer apiConsumer;
  List<HotelRoomsModel>? roomsModel;

  getHotelRoomsById() async {
    try {
      emit(HotelRoomsByIdLoading());
      final response = await apiConsumer.get(
        EndPoint.getHotelRoomsById +
            CacheHelper().getData(key: 'hotel_id').toString(),
      );
      roomsModel = (response as List)
          .map((e) => HotelRoomsModel.fromJson(e))
          .toSet()
          .toList();
      emit(HotelRoomsByIdSuccess(hotelroomsmodel: roomsModel!));
    } on ServerException catch (e) {
      emit(HotelRoomsByIdFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
