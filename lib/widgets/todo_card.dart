import 'package:flutter/material.dart';
import 'package:flutter_api/models/todo_model.dart'; //add
import 'package:flutter_api/utils/pallete.dart';

class TodoCard extends StatelessWidget {
  //add
  final Todo todo;

  const TodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
      decoration: BoxDecoration(color: Pallete.cardColor),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 42.0,
                width: 42.0,
                decoration: BoxDecoration(
                  color: Pallete.iconBg,
                  borderRadius: BorderRadius.all(Radius.circular(42.0)),
                ),
                child: Icon(
                  Icons.task,
                  color: Pallete.mainBlue,
                ),
              ),
              const SizedBox(width: 20.0),
              Flexible(
                //wrap to avoid overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UserId: ' + todo.userId.toString(), //modify
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'ID: ' + todo.id.toString(), //modify
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none, //modify
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
