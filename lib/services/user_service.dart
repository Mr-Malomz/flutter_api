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

  Future<APIResponse<User>> getSingleUser(int id) {
    return http.get(Uri.parse('$URL/$id')).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        final singleUser = User.fromJson(jsonData);

        return APIResponse<User>(data: singleUser);
      }
      return APIResponse<User>(
          isError: true, errorMessage: 'Error getting list of users');
    }).catchError((_) => APIResponse<User>(
        isError: true, errorMessage: 'Error getting list of users'));
  }

  Future<APIResponse<User>> createUser(User user) {
    return http.post(Uri.parse(URL), body: jsonEncode(user)).then((value) {
      if (value.statusCode == 201) {
        final jsonData = json.decode(value.body);
        final singleUser = User.fromJson(jsonData);

        return APIResponse<User>(data: singleUser);
      }
      return APIResponse<User>(
          isError: true, errorMessage: 'Error creating user');
    }).catchError((_) =>
        APIResponse<User>(isError: true, errorMessage: 'Error creating user'));
  }

  Future<APIResponse<User>> updateUser(int id, User user) {
    return http.put(Uri.parse('$URL/$id'), body: jsonEncode(user)).then(
        (value) {
      if (value.statusCode == 204) {
        final jsonData = json.decode(value.body);
        final singleUser = User.fromJson(jsonData);

        return APIResponse<User>(data: singleUser);
      }
      return APIResponse<User>(
          isError: true, errorMessage: 'Error updating user');
    }).catchError((_) =>
        APIResponse<User>(isError: true, errorMessage: 'Error updating user'));
  }

  Future<APIResponse<User>> deleteUser(int id) {
    return http.delete(Uri.parse('$URL/$id')).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);

        return APIResponse<User>(data: jsonData);
      }
      return APIResponse<User>(
          isError: true, errorMessage: 'Error deleting user');
    }).catchError((_) =>
        APIResponse<User>(isError: true, errorMessage: 'Error deleting user'));
  }
}
