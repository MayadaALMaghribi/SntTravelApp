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
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['totalPrice'] = this.totalPrice;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityId'] = this.activityId;
    data['activityName'] = this.activityName;
    data['image'] = this.image;
    data['pricePerPerson'] = this.pricePerPerson;
    data['peopleCount'] = this.peopleCount;
    data['totalForThisActivity'] = this.totalForThisActivity;
    data['locationNames'] = this.locationNames;
    return data;
  }
}