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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['itemId'] = itemId;
    data['itemType'] = itemType;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
