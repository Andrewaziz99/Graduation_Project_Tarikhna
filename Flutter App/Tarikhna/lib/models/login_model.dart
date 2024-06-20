class LoginModel{
  bool? status;
  String? message;
  UserData? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? id;
  String? name;
  String? email;
  int? year;
  String? token;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.year,
        this.token,});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    year = json['year'];
    token = json['token'];
  }
}