import 'package:sntegpito/Features/favourite/data/models/fav_item.dart';

class AddFavouriteModel {
  int? statusCode;
  String? message;
  FavoriteItem? favoriteItem;

  AddFavouriteModel({this.statusCode, this.message, this.favoriteItem});

  AddFavouriteModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    favoriteItem = json['favoriteItem'] != null
        ? FavoriteItem.fromJson(json['favoriteItem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (favoriteItem != null) {
      data['favoriteItem'] = favoriteItem!.toJson();
    }
    return data;
  }
}
