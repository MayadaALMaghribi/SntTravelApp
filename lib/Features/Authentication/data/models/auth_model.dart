import 'package:sntegpito/core/api/end_ponits.dart';

class AuthModel {
  final String message;

  AuthModel({required this.message});

  factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthModel(message: jsonData[ApiKey.signupmessage]);
  }
}
