class AddCartModel {
  int? statusCode;
  String? message;
  AddedActivity? addedActivity;

  AddCartModel({this.statusCode, this.message, this.addedActivity});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    addedActivity = json['addedActivity'] != null
        ? AddedActivity.fromJson(json['addedActivity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (addedActivity != null) {
      data['addedActivity'] = addedActivity!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['activityId'] = activityId;
    data['activityName'] = activityName;
    data['activityPrice'] = activityPrice;
    data['activityImageUrl'] = activityImageUrl;
    data['locationName'] = locationName;
    data['numberOfGuests'] = numberOfGuests;
    data['addedAt'] = addedAt;
    return data;
  }
}
