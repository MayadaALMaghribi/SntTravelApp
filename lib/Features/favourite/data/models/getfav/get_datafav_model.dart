import 'package:sntegpito/Features/favourite/data/models/getfav/get_item_list_fav.dart';

class Data {
  int? favoriteId;
  int? itemId;
  String? itemType;
  String? addedAt;
  bool? isFavorite;
  ItemDetails? itemDetails;

  Data(
      {this.favoriteId,
      this.itemId,
      this.itemType,
      this.addedAt,
      this.isFavorite,
      this.itemDetails});

  Data.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favoriteId'];
    itemId = json['itemId'];
    itemType = json['itemType'];
    isFavorite = json['isFavorite'];
    addedAt = json['addedAt'];
    itemDetails = json['itemDetails'] != null
        ? ItemDetails.fromJson(json['itemDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favoriteId'] = favoriteId;
    data['itemId'] = itemId;
    data['itemType'] = itemType;
    data['addedAt'] = addedAt;
    data['isFavorite'] = isFavorite;
    if (itemDetails != null) {
      data['itemDetails'] = itemDetails!.toJson();
    }
    return data;
  }
}
