
class FavoriteItem {
  int? userId;
  int? itemId;
  String? itemType;
  String? imageUrl;

  FavoriteItem({this.userId, this.itemId, this.itemType, this.imageUrl});

  FavoriteItem.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    itemId = json['itemId'];
    itemType = json['itemType'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['itemId'] = this.itemId;
    data['itemType'] = this.itemType;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}