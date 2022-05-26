class UserData {
  /// More private userData to store general info about users
  String? uid;
  String? email;
  String? password;
  String? name;
  String? phone;
  bool? verified;

  UserData(
      {this.uid,
      this.email,
      this.password,
      this.name,
      this.phone,
      this.verified});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['uid'] = uid;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['verified'] = verified;
    return map;
  }

  UserData.fromMapObject(Map<String, dynamic> map) {
    uid = map['uid'];
    email = map['email'];
    password = map['password'];
    name = map['name'];
    phone = map['phone'];
    verified = map['verified'];
  }
}
