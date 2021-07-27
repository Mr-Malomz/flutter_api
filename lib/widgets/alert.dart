import 'package:flutter/material.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.warning),
          const SizedBox(width: 10.0),
          const Text('Warning'),
        ],
      ),
      content: const Text('Are you sure you want to delet this user?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Yes')),
      ],
    );
  }
}
