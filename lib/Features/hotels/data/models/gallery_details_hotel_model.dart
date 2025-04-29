class GalleryDetailsHotelModel {
  int? mediaId;
  String? mediaUrl;

  GalleryDetailsHotelModel({this.mediaId, this.mediaUrl});

  GalleryDetailsHotelModel.fromJson(Map<String, dynamic> json) {
    mediaId = json['mediaId'];
    mediaUrl = json['mediaUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mediaId'] = this.mediaId;
    data['mediaUrl'] = this.mediaUrl;
    return data;
  }
}
