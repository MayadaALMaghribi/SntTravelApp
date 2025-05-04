class GalleryDetailsHotelModel {
  int? mediaId;
  String? mediaUrl;

  GalleryDetailsHotelModel({this.mediaId, this.mediaUrl});

  GalleryDetailsHotelModel.fromJson(Map<String, dynamic> json) {
    mediaId = json['mediaId'];
    mediaUrl = json['mediaUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mediaId'] = mediaId;
    data['mediaUrl'] = mediaUrl;
    return data;
  }
}
