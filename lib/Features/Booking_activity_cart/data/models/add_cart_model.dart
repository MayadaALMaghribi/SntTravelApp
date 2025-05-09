class AddCartModel {
  int? statusCode;
  String? message;
  AddedActivity? addedActivity;

  AddCartModel({this.statusCode, this.message, this.addedActivity});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    addedActivity = json['addedActivity'] != null
        ? new AddedActivity.fromJson(json['addedActivity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.addedActivity != null) {
      data['addedActivity'] = this.addedActivity!.toJson();
    }
    return data;
  }
}

class AddedActivity {
  int? id;
  int? userId;
  int? activityId;
  String? activityName;
  int? activityPrice;
  String? activityImageUrl;
  String? locationName;
  int? numberOfGuests;
  String? addedAt;

  AddedActivity(
      {this.id,
      this.userId,
      this.activityId,
      this.activityName,
      this.activityPrice,
      this.activityImageUrl,
      this.locationName,
      this.numberOfGuests,
      this.addedAt});

  AddedActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    activityId = json['activityId'];
    activityName = json['activityName'];
    activityPrice = json['activityPrice'];
    activityImageUrl = json['activityImageUrl'];
    locationName = json['locationName'];
    numberOfGuests = json['numberOfGuests'];
    addedAt = json['addedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['activityId'] = this.activityId;
    data['activityName'] = this.activityName;
    data['activityPrice'] = this.activityPrice;
    data['activityImageUrl'] = this.activityImageUrl;
    data['locationName'] = this.locationName;
    data['numberOfGuests'] = this.numberOfGuests;
    data['addedAt'] = this.addedAt;
    return data;
  }
}