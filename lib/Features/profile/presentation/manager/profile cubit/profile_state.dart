class ProfileState {}
final class UploadProfilePictureIntial extends ProfileState{}
//final class UploadProfilePicture extends UserState{}
final class UploadProfilePictureLoading extends ProfileState{}
final class UploadProfilePictureSuccess extends ProfileState{}
final class UploadProfilePictureFailure extends ProfileState{
  final dynamic errmessage;

  UploadProfilePictureFailure({required this.errmessage});
}

final class UpdateusernameLoading extends ProfileState{}
final class UpdateusernameSuccess extends ProfileState{
  final String message;

  UpdateusernameSuccess({required this.message});
}
final class UpdateusernameFailure extends ProfileState{

  final String errmessage;

  UpdateusernameFailure({required this.errmessage});

}
final class UpdatepasswordLoading extends ProfileState{}
final class UpdatepasswordSuccess extends ProfileState{
  final String message;

  UpdatepasswordSuccess({required this.message});

  
}
final class UpdatepasswordFailure extends ProfileState{

  final String errmessage;

  UpdatepasswordFailure({required this.errmessage});

 
}