class ServicesHotelDetailsModel {
  int? serviceId;
  String? name;
  String? iconName;
  String? iconType;

  ServicesHotelDetailsModel(
      {this.serviceId, this.name, this.iconName, this.iconType});

  ServicesHotelDetailsModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    name = json['name'];
    iconName = json['iconName'];
    iconType = json['iconType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceId'] = serviceId;
    data['name'] = name;
    data['iconName'] = iconName;
    data['iconType'] = iconType;
    return data;
  }
}
