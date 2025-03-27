class TourismTypeModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  bool? isActive;

  TourismTypeModel(
      {this.id, this.name, this.description, this.imageUrl, this.isActive});

  TourismTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ;
    description = json['description'];
    imageUrl = json['imageUrl'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['is_active'] = isActive;
    return data;
  }
}
