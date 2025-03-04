class EndPoint {
  static String baseUrl = "http://tourism.runasp.net/api/";
  static String signIn = "Acount/login";
  static String signUp = "Acount/SendVerificationCode";
  static String verify = "Acount/VerifyCodeAndRegister";
  static String resendcode = "Acount/ResendVerificationCode";
  static String forget = "Acount/forgot-password";
  static String otp = "Acount/validate-otp";
  static String resetpassward = "Acount/reset-password";
  static String uploadpicture = "UpdateProfile/update-profile-picture";
  static String getuserprofile = "UpdateProfile/GetUserProfile";
  static String updateusername = "UpdateProfile/UpdateUserName";
  static String updatepassword = "UpdateProfile/UpdatePassword";
  static String tourismtype = "TourismType/GetTourismTypes";
  static String imagediscount = "TourismType/image-discount";
  static String getAllLocationsByTourismTypeID =
      "Locations/GetLocationsByTourismType/1";
  static String getActivityByLocationId = "Activitys/locations/";
}

class ApiKey {
  static String status = "statusCode";
  static String errorMessage = "message";
  static String username = "userName";
  static String password = "password";
  static String token = "token";
  static String expiration = "expiration";
  static String id = "id";
  static String fullname = "fullName";
  static String email = "email";
  static String passport = "passPortNumber";
  static String signupmessage = "message";
  static String code = "verificationCode"; //verificationCode
  static String otpcode = "otp";
  static String newpassword = "newPassword";
  static String confirmpassword = "confirmPassword";
  static String poster = "Poster";
  static String profilepic = "imageUrl";
  static String getusername = "userName";
  static String getprofilepicture = "profilePicture";
  static String newusername = "newUserName";
  static String oldpassword = "oldPassword";
  //static String tourismid = "id";
}
