class ValidAuthtoApp {
  bool? valid;
  User? user;

  ValidAuthtoApp({this.valid, this.user});

  ValidAuthtoApp.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valid'] = this.valid;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['userName'] = this.userName;
    return data;
  }
}
