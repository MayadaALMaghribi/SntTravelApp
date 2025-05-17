// class GetActivityForBookingModel {
//   int? statusCode;
//   String? message;
//   List<Activities>? activities;

//   GetActivityForBookingModel({this.statusCode, this.message, this.activities});

//   GetActivityForBookingModel.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     message = json['message'];
//     if (json['activities'] != null) {
//       activities = <Activities>[];
//       json['activities'].forEach((v) {
//         activities!.add(Activities.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['statusCode'] = statusCode;
//     data['message'] = message;
//     if (activities != null) {
//       data['activities'] = activities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Activities {
//   int? activityId;
//   String? activityName;
//   int? activityPrice;
//   String? activityImageUrl;
//   String? activityStartDate;
//   String? activityEndDate;

//   Activities(
//       {this.activityId,
//       this.activityName,
//       this.activityPrice,
//       this.activityImageUrl,
//       this.activityStartDate,
//       this.activityEndDate});

//   Activities.fromJson(Map<String, dynamic> json) {
//     activityId = json['activityId'];
//     activityName = json['activityName'];
//     activityPrice = json['activityPrice'];
//     activityImageUrl = json['activityImageUrl'];
//     activityStartDate = json['activityStartDate'];
//     activityEndDate = json['activityEndDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['activityId'] = activityId;
//     data['activityName'] = activityName;
//     data['activityPrice'] = activityPrice;
//     data['activityImageUrl'] = activityImageUrl;
//     data['activityStartDate'] = activityStartDate;
//     data['activityEndDate'] = activityEndDate;
//     return data;
//   }
// }

class GetActivityForBookingModel {
  int? statusCode;
  String? message;
  List<Activities>? activities;

  GetActivityForBookingModel({this.statusCode, this.message, this.activities});

  GetActivityForBookingModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  int? activityId;
  String? activityName;
  int? activityPrice;
  String? activityImageUrl;
  String? activityStartDate;
  String? activityEndDate;
  int? numberOfGuests;

  Activities(
      {this.activityId,
      this.activityName,
      this.activityPrice,
      this.activityImageUrl,
      this.activityStartDate,
      this.activityEndDate,
      this.numberOfGuests});

  Activities.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    activityName = json['activityName'];
    activityPrice = json['activityPrice'];
    activityImageUrl = json['activityImageUrl'];
    activityStartDate = json['activityStartDate'];
    activityEndDate = json['activityEndDate'];
    numberOfGuests = json['numberOfGuests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityId'] = this.activityId;
    data['activityName'] = this.activityName;
    data['activityPrice'] = this.activityPrice;
    data['activityImageUrl'] = this.activityImageUrl;
    data['activityStartDate'] = this.activityStartDate;
    data['activityEndDate'] = this.activityEndDate;
    data['numberOfGuests'] = this.numberOfGuests;
    return data;
  }
}
