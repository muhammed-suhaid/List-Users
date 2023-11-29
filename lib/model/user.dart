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
    final name = UserName(
      title: user['name']['title'],
      first: user['name']['first'],
      last: user['name']['last'],
    );
    final date = user['dob']['date'];
    final dob = UserDob(
      date: DateTime.parse(date),
      age: user['dob']['age'],
    );
    final coordinates = LocationCoordinate(
      latitude: user['location']['coordinates']['latitude'],
      longitude: user['location']['coordinates']['longitude'],
    );
    final street = LocationStreet(
      name: user['location']['street']['name'],
      number: user['location']['street']['number'],
    );
    final timezone = LocationTimezone(
      description: user['location']['timezone']['description'],
      offset: user['location']['timezone']['offset'],
    );
    final location = UserLocation(
      city: user['location']['city'],
      state: user['location']['state'],
      country: user['location']['country'],
      postcode: user['location']['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
    final picture = UserPicture(
      large: user['picture']['large'],
      medium: user['picture']['medium'],
      thumbnail: user['picture']['thumbnail'],
    );
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
