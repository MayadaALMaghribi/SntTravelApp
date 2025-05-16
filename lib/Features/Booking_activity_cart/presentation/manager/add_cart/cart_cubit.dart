import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/add_cart_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/error_model.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.apiConsumer) : super(AddCartInitial());
  final ApiConsumer apiConsumer;
  AddCartModel? addCartModel;
  ErrorModel? errorModel;

  // add to cart
  addToCart({
    required int userId,
    required int activityId,
    required int numOfGeusts,
    required BuildContext context,
  }) async {
    try {
      emit(AddCartLoading());
      final response =
          await apiConsumer.post(EndPoint.addcart, isFromData: false, data: {
        ApiKey.userId: userId,
        ApiKey.activityId: activityId,
        ApiKey.numberofguests: numOfGeusts,
      });
      if (response == null) {
        emit(AddCartFailure(errmessage: "response are null"));
      } else if (response is! Map<String, dynamic>) {
        emit(AddCartFailure(
            errmessage: "Unexpected data format from the server"));
        return;
      } else {
        addCartModel = AddCartModel.fromJson(response);
        emit(AddCartSuccess(successmessage: addCartModel!.message.toString()));
        context.read<GetAllActivityCartCubit>().fetchAllActivityCart();
      }
    } on ServerException catch (e) {
      emit(AddCartFailure(errmessage: e.errModel.errorMessage));
    }
  }

  //Remove fromCart
  removeFromCart({
    required int userId,
    required int activityId,
    required BuildContext context,
  }) async {
    try {
      emit(RemoveCartLoading());
      final response =
          await apiConsumer.delete("${EndPoint.removecart}$userId/$activityId");
      if (response == null) {
        emit(RemoveCartFailure(errorModel: errorModel!));
        return;
      } else {
        errorModel =
            ErrorModel.fromJson(response); //عشان نفس ال model بتاع الايرور
        emit(RemoveCartSuccess(errorModel: errorModel!));
        context.read<GetAllActivityCartCubit>().fetchAllActivityCart();
      }
    } on ServerException catch (e) {
      emit(RemoveCartFailure(errorModel: e.errModel));
    }
  }
}
