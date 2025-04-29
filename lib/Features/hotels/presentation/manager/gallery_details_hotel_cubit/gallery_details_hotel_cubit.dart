import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../data/models/gallery_details_hotel_model.dart';

part 'gallery_details_hotel_state.dart';

class GalleryDetailsHotelCubit extends Cubit<GalleryDetailsHotelState> {
  GalleryDetailsHotelCubit(this.apiConsumer)
      : super(GalleryDetailsHotelInitial());
  final ApiConsumer apiConsumer;
  List<GalleryDetailsHotelModel> gallarydetailshotelModel = [];
  fetchGalleryimagedetailshotel({required String idhotel}) async {
    try {
      emit(GalleryDetailsHoteloading());
      final data = await apiConsumer.get(
        "${EndPoint.fetchgallery}$idhotel/images",
      );
      if (data == null) {
        emit(GalleryDetailsHotelFailure(errmessage: "Data are Null"));
      } else {
        gallarydetailshotelModel = (data as List)
            .map((e) => GalleryDetailsHotelModel.fromJson(e))
            .toSet()
            .toList();
        emit(GalleryDetailsHotelSucess(
            gallarydetailshotel: gallarydetailshotelModel));
      }
    } on ServerException catch (e) {
      emit(GalleryDetailsHotelFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
