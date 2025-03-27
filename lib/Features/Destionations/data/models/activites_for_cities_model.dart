class ActivitesforcitiesModel {
  int? id;
  String? name;
  String? description;
  String? moreDescription;
  int? price;
  int? durationHours;
  String? imageUrl;
  String? locationName;

  ActivitesforcitiesModel(
      {this.id,
      this.name,
      this.description,
      this.moreDescription,
      this.price,
      this.durationHours,
      this.imageUrl,
      this.locationName});

  ActivitesforcitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    moreDescription = json['moreDescription'];
    price = json['price'];
    durationHours = json['durationHours'];
    imageUrl = json['imageUrl'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['moreDescription'] = moreDescription;
    data['price'] = price;
    data['durationHours'] = durationHours;
    data['imageUrl'] = imageUrl;
    data['locationName'] = locationName;
    return data;
  }
}
