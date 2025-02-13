

import 'package:sntegpito/core/api/end_ponits.dart';

class GetuserprofileModel {
   final String username;
   final String email;
   final String profilePicture;

  GetuserprofileModel({required this.username,required this.email,required this.profilePicture});

  factory GetuserprofileModel.fromJson(Map<String, dynamic> jsonData) {
    return GetuserprofileModel(
      username: jsonData[ApiKey.getusername], 
      email: jsonData[ApiKey.email], 
      profilePicture: jsonData[ApiKey.getprofilepicture],
      );
  }
}