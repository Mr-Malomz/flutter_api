import 'package:flutter/material.dart';
import 'package:flutter_api/utils/pallete.dart';

class TodoCard extends StatelessWidget {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UserId: 1',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'ID: 1',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'delectus aut autem',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
