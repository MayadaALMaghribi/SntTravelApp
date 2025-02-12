import 'package:sntegpito/core/api/end_ponits.dart';

class SignInModel {
  final String token;
  final String expiration;
  final int statusCode;

  SignInModel({
    required this.token,
    required this.expiration,
    required this.statusCode,
  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      token: jsonData[ApiKey.token] ?? "", // قيمة افتراضية فارغة
      expiration: jsonData[ApiKey.expiration] ?? "", // قيمة افتراضية فارغة
      statusCode: int.tryParse(jsonData[ApiKey.status]?.toString() ?? "0") ??
          0, // قيمة افتراضية
    );
  }
}
