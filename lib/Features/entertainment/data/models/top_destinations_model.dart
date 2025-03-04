import 'package:sntegpito/Features/entertainment/data/models/tourism_type_model.dart';

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
        ? new TourismType.fromJson(json['tourismType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    if (this.tourismType != null) {
      data['tourismType'] = this.tourismType!.toJson();
    }
    return data;
  }
}
