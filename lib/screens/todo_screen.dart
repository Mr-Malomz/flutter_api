import 'package:flutter/material.dart';
import 'package:flutter_api/models/todo_model.dart';
import 'package:flutter_api/utils/pallete.dart';
import 'package:flutter_api/widgets/todo_card.dart';
//add
import 'package:flutter_api/models/api_response.dart';
import 'package:flutter_api/services/todo_service.dart';
import 'package:get_it/get_it.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  //add
  TodoService get service => GetIt.instance<TodoService>();

  APIResponse<List<Todo>>? _response;
  bool _isLoading = false;
  int? todoCount;

  @override
  void initState() {
    _fetchTodo();
    super.initState();
  }

  _fetchTodo() async {
    setState(() {
      _isLoading = true;
    });

    _response = await service.getAllTodos();

    setState(() {
      _isLoading = false;
      todoCount = _response!.data!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.mainBlue,
        title: Text(
          'Todos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
      ),
      //modify
      body: Builder(
        builder: (context) {
          if (_isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (_response!.isError) {
            return Center(
              child: Text(_response!.errorMessage.toString()),
            );
          }
          return ListView.builder(
            itemCount: todoCount,
            itemBuilder: (BuildContext context, int index) {
              final Todo todo = _response!.data![index];
              return TodoCard(todo: todo);
            },
          );
        },
      ),
    );
  }
}
