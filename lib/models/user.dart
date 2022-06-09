import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";

  String? id;
  String? name;
  String? email;

  UserModel({this.email, this.id, this.name});

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     email: json[EMAIL],
  //     id: json[ID],
  //     name: json[NAME],
  //   );
  // }
  UserModel.fromJson(DocumentSnapshot data) {
    id = data[ID];
    name = data[NAME];
    email = data[EMAIL];
  }

  Map<String, dynamic> toMap() {
    return {
      EMAIL: email,
      ID: id,
      NAME: name,
    };
  }
}
