import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/Features/favourite/data/models/getfav/get_fav_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'getfav_state.dart';

class GetfavCubit extends Cubit<GetfavState> {
  GetfavCubit(this.apiConsumer) : super(GetfavInitial());
  final ApiConsumer apiConsumer;
  GetFavouriteModel? itemfavModel;
  fetchGetFav() async {
    try {
      emit(GetfavLoading());
      final response =
          await apiConsumer.get(EndPoint.getfav + Constants.userid.toString());
      if (response == null) {
        emit(GetfavFauiler(errmessage: "response are NuLL"));
      } else {
        itemfavModel = (response as List)
            .map((e) => GetFavouriteModel.fromJson(e))
            .toList();
        emit(GetfavSucess(getfavmodel: itemfavModel));
      }
    } on ServerException catch (e) {
      emit(GetfavFauiler(errmessage: e.errModel.errorMessage));
    }
  }
}
