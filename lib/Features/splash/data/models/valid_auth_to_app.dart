class ValidAuthtoApp {
  bool? valid;
  User? user;

  ValidAuthtoApp({this.valid, this.user});

  ValidAuthtoApp.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valid'] = valid;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? userName;

  User({this.id, this.email, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['userName'] = userName;
    return data;
  }
}
