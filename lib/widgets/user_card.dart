import 'package:flutter/material.dart';
import 'package:flutter_api/screens/modify_user.dart';
import 'package:flutter_api/utils/pallete.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                    'Leanne Graham',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Sincere@april.biz',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '1-770-736-8031 x56442',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Pallete.mainBlue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CustomButtons(
                label: 'DELETE',
                bgColor: Pallete.red,
                onPressed: () {},
              ),
              const SizedBox(width: 20.0),
              _CustomButtons(
                label: 'EDIT',
                bgColor: Pallete.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModifyUser(),
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomButtons extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Function()? onPressed;

  const _CustomButtons({
    Key? key,
    required this.label,
    required this.bgColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(127.0, 36.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
