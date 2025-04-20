
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
        ? new FavoriteItem.fromJson(json['favoriteItem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.favoriteItem != null) {
      data['favoriteItem'] = this.favoriteItem!.toJson();
    }
    return data;
  }
}
