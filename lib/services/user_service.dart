import 'dart:convert';

import 'package:flutter_api/models/api_response.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const URL = 'http://jsonplaceholder.typicode.com/users';

  Future<APIResponse<List<User>>> getAllUsers() {
    return http.get(Uri.parse(URL)).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body) as List;
        final listOfUsers =
            jsonData.map((data) => User.fromJson(data)).toList();

        return APIResponse<List<User>>(data: listOfUsers);
      }
      return APIResponse<List<User>>(
          isError: true, errorMessage: 'Error getting list of users');
    }).catchError((_) => APIResponse<List<User>>(
        isError: true, errorMessage: 'Error getting list of users'));
  }
}
