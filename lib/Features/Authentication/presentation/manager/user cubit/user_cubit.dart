import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sntegpito/Features/Authentication/data/models/auth_model.dart';
import 'package:sntegpito/Features/Authentication/data/models/sign_in_model.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.apiConsumer) : super(SignInInitial());
  final ApiConsumer apiConsumer;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  // XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPassport = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  TextEditingController codeController = TextEditingController();
  //forget password
  final TextEditingController forgetemail = TextEditingController();
  final GlobalKey<FormState> forgetformKey = GlobalKey<FormState>();

  //otp
  final TextEditingController otpcode = TextEditingController();

  //resetpassword
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  // final TextEditingController newusernameController = TextEditingController();
  //updatepassword
  //  final TextEditingController oldpasswordController = TextEditingController();
  // final TextEditingController updatePasswordController =
  //     TextEditingController();
  // final TextEditingController confirmeupdatepassController =
  //     TextEditingController();

  SignInModel? user;
  AuthModel? signupmodel,
      verify,
      resend,
      forgetpass,
      otpmodel,
      newpass,
      newuser,
      updatepass;

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await apiConsumer.post(EndPoint.signIn, data: {
        ApiKey.username: signInEmail.text,
        ApiKey.password: signInPassword.text,
      });

      // التحقق من وجود البيانات المطلوبة في الاستجابة
      if (response.containsKey(ApiKey.token) &&
          response.containsKey(ApiKey.expiration)) {
        user = SignInModel.fromJson(response);

        // فك التشفير والتأكد من وجود الـ id في الـ token
        final decodedToken = JwtDecoder.decode(user!.token);
        if (response.containsKey("token")) {
          CacheHelper().saveData(key: ApiKey.token, value: user!.token);
          //print(response);
        } else {
        //  print(" Token not found ");
          emit(SignInFailure(errmessage: "Token not found"));
        //  print(response);
          return;
        }
        //print("success 1");
        signInEmail.clear();
        signInPassword.clear();
        emit(SignInSuccess(successmessage: "login success"));
        //print("success 2");
      } else {
        emit(SignInFailure(errmessage: "Invalid response from server"));
      }
    } on ServerException catch (e) {
      emit(SignInFailure(errmessage: e.errModel.errorMessage));
    } catch (e) {
      emit(SignInFailure(errmessage: "An unknown error occurred: $e"));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());

      final response = await apiConsumer.post(
        EndPoint.signUp,
        isFromData: false,
        data: {
          ApiKey.fullname: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.passport: signUpPassport.text,
          ApiKey.password: signUpPassword.text,
        },
      );

      // التحقق من نوع الاستجابة
      if (response is Map<String, dynamic>) {
        // إذا كانت الاستجابة JSON
        signupmodel = AuthModel.fromJson(response);

        emit(SignUpSuccess(message: signupmodel!.message));
      } else if (response is String) {
        // إذا كانت الاستجابة نصاً
        try {
          final jsonResponse = jsonDecode(response);
          signupmodel = AuthModel.fromJson(jsonResponse);

          emit(SignUpSuccess(message: signupmodel!.message));
        } on ServerException catch (e) {
          emit(SignUpFailure(errmessage: e.errModel.errorMessage));
        }
      } else {
        emit(SignUpFailure(errmessage: "Invalid response format"));
      }
    } on ServerException catch (e) {
      emit(SignUpFailure(errmessage: e.errModel.errorMessage));
    }
  }

  verifyy() async {
    try {
      emit(VerifyLoading());
      final response = await apiConsumer.post(EndPoint.verify,
          isFromData: false,
          queryParameters: {ApiKey.code: codeController.text});
      verify = AuthModel.fromJson(response);
      emit(VerifySuccess(message: verify!.message));
      //print(response);
    } on ServerException catch (e) {
      emit(VerifyFailure(errmessage: e.errModel.errorMessage));
    }
  }

  resendcode({required String email}) async {
    try {
      final response = await apiConsumer.post(EndPoint.resendcode,
          isFromData: false, data: {ApiKey.email: email});
      verify = AuthModel.fromJson(response);

      print(response);
    } on ServerException catch (e) {
      emit(VerifyFailure(errmessage: e.errModel.errorMessage));
    }
  }

  forget() async {
    try {
      emit(forgetLoading());
      final response = await apiConsumer.post(EndPoint.forget,
          isFromData: false, data: {ApiKey.email: forgetemail.text});
      forgetpass = AuthModel.fromJson(response);
      emit(forgetSuccess(message: forgetpass!.message));
      print(response);
    } on ServerException catch (e) {
      emit(forgetFailure(errmessage: e.errModel.errorMessage));
    }
  }

  otpForget() async {
    try {
      emit(otpLoading());
      final response = await apiConsumer.post(
        EndPoint.otp,
        isFromData: false,
        data: {ApiKey.otpcode: otpcode.text},
      );
      otpmodel = AuthModel.fromJson(response);

      emit(otpSuccess(message: otpmodel!.message));
      print(response);
    } on ServerException catch (e) {
      emit(otpFailure(errmessage: e.errModel.errorMessage));
    }
  }

  resetPassword() async {
    try {
      emit(resetpassLoading());
      final response = await apiConsumer.post(
        EndPoint.resetpassward,
        isFromData: false,
        data: {
          ApiKey.newpassword: newpasswordController.text,
          ApiKey.confirmpassword: confirmPasswordController.text,
        },
      );
      //newpass = AuthModel.fromJson(response);
      emit(resetpassSuccess(message: "Password reset successful."));
    } on ServerException catch (e) {
      emit(resetpassFailure(errmessage: e.errModel.errorMessage));
    }
  }

  
  
}

