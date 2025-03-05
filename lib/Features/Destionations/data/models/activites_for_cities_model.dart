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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['moreDescription'] = this.moreDescription;
    data['price'] = this.price;
    data['durationHours'] = this.durationHours;
    data['imageUrl'] = this.imageUrl;
    data['locationName'] = this.locationName;
    return data;
  }
}
