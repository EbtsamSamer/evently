import 'dart:ui';
class UserModel {
  String name;
  String phone;
  String email;
  String id;


  UserModel(this.name, this.phone, this.email, this.id);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'id': id,

    };
  }

  // Create a UserModel instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['name'] ??" ",
      json['phone'] ??" ",
      json['email'] ??" ",
      json['id']??" ",

    );
  }
}