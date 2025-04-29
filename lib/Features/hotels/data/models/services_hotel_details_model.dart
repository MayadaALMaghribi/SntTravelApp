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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['name'] = this.name;
    data['iconName'] = this.iconName;
    data['iconType'] = this.iconType;
    return data;
  }
}
