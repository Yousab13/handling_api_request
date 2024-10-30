import 'package:mastring_api/core/api/end_points.dart';

class UserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> address;

  UserModel({
    required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      profilePic: jsonData['user'][Apikey.profilePic],
      email: jsonData['user'][Apikey.email],
      phone: jsonData['user'][Apikey.phone],
      name: jsonData['user'][Apikey.name],
      address: jsonData['user'][Apikey.location],
    );
  }
}