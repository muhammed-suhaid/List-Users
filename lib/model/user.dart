import 'package:flutter_api/model/user_dob.dart';
import 'package:flutter_api/model/user_location.dart';
import 'package:flutter_api/model/user_name.dart';
import 'package:flutter_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.cell,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    final name = UserName.fromMap(user['name']);

    final dob = UserDob.fromMap(user['dob']);

    final location = UserLocation.fromMap(user['location']);

    final picture = UserPicture.fromMap(user['picture']);

    return User(
      email: user['email'],
      cell: user['cell'],
      gender: user['gender'],
      nat: user['nat'],
      phone: user['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
