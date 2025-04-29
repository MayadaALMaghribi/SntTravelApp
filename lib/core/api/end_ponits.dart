class EndPoint {
  static String baseImageUrl = "http://tourism.runasp.net/";
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
  static String getHotelsByLocationName = "Hotels/by-location-name/";
  static String getHotelRoomsById = "Rooms/hotel-rooms/";
  static String hotelFilter = "Hotels/filter-hotels";
  static String addfav = "Favourite/add-favorite";
  static String removefav = "Favourite/remove-favorite";
  static String getfav = "Favourite/user-favorites/";
  static String fetchgallery = "Hotels/hotel/";
  static String serviceshotel = "Servicies/services/";
  static String bookingroom = "Rooms/book";
  static String getDetailsBookingBefore =
      "Rooms/booking-details-beforePayment/";
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
  static String startDateFilter = "startDate";
  static String endDateFilter = "endDate";
  static String guestsFilter = "guests";
  static String roomsRequiredFilter = "roomsRequired";
  static String minPriceFilter = "minPrice";
  static String maxPriceFilter = "maxPrice";
  static String minStarsFilter = "minStars";
  static String userId = "userId"; //userId
  static String itemIdfav = "itemId";
  static String itemTypefav = "itemType";
  static String roomid = "roomId";
  static String paymentmethod = "paymentMethodId";
  static String numberofguests = "numberOfGuests";
}

class Constants {
  static String itemTypefav = "Activity";
  static int useridFav = 1136;
  static String idhotel = "hotel_id";
  static String fromDate = "from_date";
  static String toDate = "to_date";
  static String guests = "guest";
}
