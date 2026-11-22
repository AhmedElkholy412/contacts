import 'dart:io';

class UserModel {
  String name;
  String email;
  String phone;
  File? image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.image
  });
}