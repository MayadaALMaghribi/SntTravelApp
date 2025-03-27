class ImageDiscountTourismModel {
  String? imageUrl;
  String? message;

  ImageDiscountTourismModel({this.imageUrl, this.message});

  ImageDiscountTourismModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['message'] = message;
    return data;
  }
}
