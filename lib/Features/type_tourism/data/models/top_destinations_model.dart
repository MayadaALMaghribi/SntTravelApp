import 'package:sntegpito/Features/type_tourism/data/models/tourism_type_model.dart';

class TopDestinationModel {
  int? id;
  String? name;
  String? imageUrl;
  String? description;
  TourismType? tourismType;

  TopDestinationModel(
      {this.id, this.name, this.imageUrl, this.description, this.tourismType});

  TopDestinationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    tourismType = json['tourismType'] != null
        ? TourismType.fromJson(json['tourismType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    if (tourismType != null) {
      data['tourismType'] = tourismType!.toJson();
    }
    return data;
  }
}
