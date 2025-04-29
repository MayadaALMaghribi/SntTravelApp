import 'package:sntegpito/Features/favourite/data/models/getfav/get_datafav_model.dart';

class GetFavouriteModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  GetFavouriteModel({this.statusCode, this.message, this.data});

  GetFavouriteModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
