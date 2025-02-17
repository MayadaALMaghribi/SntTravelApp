class UserState {}

final class SignInInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {
  final dynamic successmessage;
  SignInSuccess({required this.successmessage});
}

final class SignInFailure extends UserState {
  final dynamic errmessage;

  SignInFailure({required this.errmessage});
}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {
  final String message;
  SignUpSuccess({required this.message});
}

final class SignUpFailure extends UserState {
  final dynamic errmessage;

  SignUpFailure({required this.errmessage});
}

final class VerifyLoading extends UserState {}

final class VerifySuccess extends UserState {
  final String message;
  VerifySuccess({required this.message});
}

final class VerifyFailure extends UserState {
  final dynamic errmessage;

  VerifyFailure({required this.errmessage});
}

final class forgetLoading extends UserState {}

final class forgetSuccess extends UserState {
  final String message;
  forgetSuccess({required this.message});
}

final class forgetFailure extends UserState {
  final dynamic errmessage;

  forgetFailure({required this.errmessage});
}

final class otpLoading extends UserState {}

final class otpSuccess extends UserState {
  final String message;
  otpSuccess({required this.message});
}

final class otpFailure extends UserState {
  final dynamic errmessage;

  otpFailure({required this.errmessage});
}

final class resetpassLoading extends UserState {}

final class resetpassSuccess extends UserState {
  final String message;
  resetpassSuccess({required this.message});
}

final class resetpassFailure extends UserState {
  final dynamic errmessage;

  resetpassFailure({required this.errmessage});
}
//final class UploadProfilePicture extends UserState{}
// final class UploadProfilePictureLoading extends UserState{}
// final class UploadProfilePictureSuccess extends UserState{}
// final class UploadProfilePictureFailure extends UserState{
//   final dynamic errmessage;

//   UploadProfilePictureFailure({required this.errmessage});
// }
//getuserprofile
// final class GetuserprofileLoading extends UserState{}
// final class GetuserprofileSuccess extends UserState{
//   final GetuserprofileModel getuserprofileModel;

//   GetuserprofileSuccess({required this.getuserprofileModel});
// }
// final class GetuserprofileFailure extends UserState{
//   final String errmessage;

//   GetuserprofileFailure({required this.errmessage});

// }
//UpdateuserName
// final class UpdateusernameLoading extends UserState{}
// final class UpdateusernameSuccess extends UserState{
//   final String message;

//   UpdateusernameSuccess({required this.message});
// }
// final class UpdateusernameFailure extends UserState{

//   final String errmessage;

//   UpdateusernameFailure({required this.errmessage});

// }
// final class UpdatepasswordLoading extends UserState{}
// final class UpdatepasswordSuccess extends UserState{
//   final String message;

//   UpdatepasswordSuccess({required this.message});

  
// }
// final class UpdatepasswordFailure extends UserState{

//   final String errmessage;

//   UpdatepasswordFailure({required this.errmessage});

 
// }