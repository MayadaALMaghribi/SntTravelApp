import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sntegpito/Features/Authentication/data/models/auth_model.dart';
import 'package:sntegpito/Features/Authentication/data/models/picture_model.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';
import 'package:sntegpito/core/functions/upload_image_to_api.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.apiConsumer) : super(UploadProfilePictureIntial());
  final ApiConsumer apiConsumer;
  //Profile Pic
  XFile? profilePic;
  picturemodel? picmodel;
  final TextEditingController newusernameController = TextEditingController();
  AuthModel? newuser, updatepass;

  final TextEditingController oldpasswordController = TextEditingController();
  final TextEditingController updatePasswordController =
      TextEditingController();
  final TextEditingController confirmeupdatepassController =
      TextEditingController();

  uploadProfilePic(XFile image) async {
    profilePic = image;
    // emit(UploadProfilePicture());
    try {
      emit(UploadProfilePictureLoading());
      final response = await apiConsumer.post(
        EndPoint.uploadpicture,
        isFromData: true,
        data: {ApiKey.profilepic: await uploadImageToApi(profilePic!)},
      );
      picmodel = picturemodel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.profilepic, value: picmodel!.imageUrl);
      if (CacheHelper().getData(key: ApiKey.profilepic) != null) {
        emit(UploadProfilePictureSuccess());
        print(CacheHelper().getData(key: ApiKey.profilepic) +
            "url picture from response");
      }
    } on ServerException catch (e) {
      emit(UploadProfilePictureFailure(errmessage: e.errModel.errorMessage));
    }
  }

  updateusername() async {
    try {
      emit(UpdateusernameLoading());
      final response = await apiConsumer.post(
        EndPoint.updateusername,
        data: {
          ApiKey.newusername = newusernameController.text,
        },
        isFromData: true,
      );
      newuser = AuthModel.fromJson(response);
      emit(UpdateusernameSuccess(message: newuser!.message));
    } on ServerException catch (e) {
      emit(UpdateusernameFailure(errmessage: e.errModel.errorMessage));
    }
  }

  updatepassword() async {
    try {
      emit(UpdatepasswordLoading());
      final response = await apiConsumer.post(
        EndPoint.updatepassword,
        data: {
          ApiKey.oldpassword = oldpasswordController.text,
          ApiKey.newpassword = updatePasswordController.text,
          ApiKey.confirmpassword = confirmeupdatepassController.text
        },
        isFromData: true,
      );
      updatepass = AuthModel.fromJson(response);
      emit(UpdatepasswordSuccess(message: updatepass!.message));
    } on ServerException catch (e) {
      emit(UpdatepasswordFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
