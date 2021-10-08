import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email;
  int group;
  String img;
  String loginId;
  String nickName;
  String phoneNumber;
  String pwd;
  String userName;


  UserModel({
    this.email,
    this.group,
    this.img,
    this.loginId,
    this.nickName,
    this.phoneNumber,
    this.pwd,
    this.userName
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    group: json["group"],
    img: json["img"],
    loginId: json["loginId"],
    nickName: json["nickName"],
    phoneNumber: json["phoneNumber"],
    pwd: json["pwd"],
    userName: json["userName"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "group": group,
    "img": img,
    "loginId": loginId,
    "nickName": nickName,
    "phoneNumber": phoneNumber,
    "pwd": pwd,
    "userName": userName,
  };
}