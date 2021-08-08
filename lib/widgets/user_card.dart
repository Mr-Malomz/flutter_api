import 'package:flutter/material.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/utils/pallete.dart';

class UserCard extends StatelessWidget {
  //add
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                  Icons.person,
                  color: Pallete.mainBlue,
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name, //modify this
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    user.email, //modify this
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    user.username, //modify this
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Pallete.mainBlue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
