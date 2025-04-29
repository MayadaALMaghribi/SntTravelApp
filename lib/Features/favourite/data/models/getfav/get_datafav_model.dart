import 'package:sntegpito/Features/favourite/data/models/getfav/get_item_list_fav.dart';

class Data {
  int? favoriteId;
  int? itemId;
  String? itemType;
  String? addedAt;
  ItemDetails? itemDetails;

  Data(
      {this.favoriteId,
      this.itemId,
      this.itemType,
      this.addedAt,
      this.itemDetails});

  Data.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favoriteId'];
    itemId = json['itemId'];
    itemType = json['itemType'];
    addedAt = json['addedAt'];
    itemDetails = json['itemDetails'] != null
        ? new ItemDetails.fromJson(json['itemDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favoriteId'] = this.favoriteId;
    data['itemId'] = this.itemId;
    data['itemType'] = this.itemType;
    data['addedAt'] = this.addedAt;
    if (this.itemDetails != null) {
      data['itemDetails'] = this.itemDetails!.toJson();
    }
    return data;
  }
}
