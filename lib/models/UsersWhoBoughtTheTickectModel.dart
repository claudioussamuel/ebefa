class UsersWhoBoughtTheTickectModel {
  static const USERID = "id";
  static const USERNAME = "name";
  static const USEREMAIL = "email";
  static const EVENTNAME = "event";

  String? id;
  String? email;
  String? name;
  String? event;

  UsersWhoBoughtTheTickectModel({this.id, this.email, this.name, this.event});

  Map<String, dynamic> toJson() => {
        USERID: id,
        USEREMAIL: email,
        USERNAME: name,
        EVENTNAME: event,
      };

  UsersWhoBoughtTheTickectModel.fromMap(Map<String, dynamic> data) {
    id = data[USERID];
    email = data[USEREMAIL];
    name = data[USERNAME];
    event = data[EVENTNAME];
  }
}
