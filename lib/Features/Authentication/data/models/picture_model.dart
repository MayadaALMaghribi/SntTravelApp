class picturemodel {
  String? message;
  String? imageUrl;

  picturemodel({this.message, this.imageUrl});

  picturemodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['imageUrl'] = imageUrl;
    return data;
  }
}