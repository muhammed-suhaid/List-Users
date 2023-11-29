import 'dart:convert';
import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/model/user_dob.dart';
import 'package:flutter_api/model/user_location.dart';
import 'package:flutter_api/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=50";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
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
      return User(
        email: user['email'],
        cell: user['cell'],
        gender: user['gender'],
        nat: user['nat'],
        phone: user['phone'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}
