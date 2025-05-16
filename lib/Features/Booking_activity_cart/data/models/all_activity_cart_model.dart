class AllActivityCartModel {
  int? statusCode;
  String? message;
  int? totalPrice;
  List<Data>? data;

  AllActivityCartModel(
      {this.statusCode, this.message, this.totalPrice, this.data});

  AllActivityCartModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    totalPrice = json['totalPrice'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['totalPrice'] = totalPrice;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? activityId;
  String? activityName;
  String? image;
  int? pricePerPerson;
  int? peopleCount;
  int? totalForThisActivity;
  List<String>? locationNames;

  Data(
      {this.activityId,
      this.activityName,
      this.image,
      this.pricePerPerson,
      this.peopleCount,
      this.totalForThisActivity,
      this.locationNames});

  Data.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    activityName = json['activityName'];
    image = json['image'];
    pricePerPerson = json['pricePerPerson'];
    peopleCount = json['peopleCount'];
    totalForThisActivity = json['totalForThisActivity'];
    locationNames = json['locationNames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityId'] = activityId;
    data['activityName'] = activityName;
    data['image'] = image;
    data['pricePerPerson'] = pricePerPerson;
    data['peopleCount'] = peopleCount;
    data['totalForThisActivity'] = totalForThisActivity;
    data['locationNames'] = locationNames;
    return data;
  }
}
