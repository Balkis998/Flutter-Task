import 'package:task_balkis/models/user_location.dart';

class UserInfo {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final DateTime dateOfBirth;
  final DateTime registerDate;
  final String phone;
  final String pictureUrl;
  final UserLocation location;

  UserInfo({
    this.email,
    this.id,
    this.title,
    this.location,
    this.gender,
    this.dateOfBirth,
    this.firstName,
    this.lastName,
    this.phone,
    this.pictureUrl,
    this.registerDate,
  });
}
