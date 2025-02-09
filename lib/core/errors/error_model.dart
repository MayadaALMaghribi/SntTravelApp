import '../api/end_ponits.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status] ?? 0, // قيمة افتراضية
      errorMessage:
          jsonData[ApiKey.errorMessage] ?? 'Unknown error', // قيمة افتراضية
    );
  }
}
