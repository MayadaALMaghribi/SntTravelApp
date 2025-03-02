class ImageDiscountTourismModel {
  String? imageUrl;
  String? message;

  ImageDiscountTourismModel({this.imageUrl, this.message});

  ImageDiscountTourismModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['message'] = this.message;
    return data;
  }
}
