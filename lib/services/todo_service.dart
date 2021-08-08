import 'dart:convert';

import 'package:flutter_api/models/api_response.dart';
import 'package:flutter_api/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  static const URL = 'http://jsonplaceholder.typicode.com/todos';

  Future<APIResponse<List<Todo>>> getAllTodos() {
    return http.get(Uri.parse(URL)).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body) as List;
        final listOfTodos =
            jsonData.map((data) => Todo.fromJson(data)).toList();

        return APIResponse<List<Todo>>(data: listOfTodos);
      }
      return APIResponse<List<Todo>>(
          isError: true, errorMessage: 'Error getting list of todos');
    }).catchError((_) => APIResponse<List<Todo>>(
        isError: true, errorMessage: 'Error getting list of todos'));
  }
}
