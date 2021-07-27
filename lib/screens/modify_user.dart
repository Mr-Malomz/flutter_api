import 'package:flutter/material.dart';
import 'package:flutter_api/utils/pallete.dart';
import 'package:email_validator/email_validator.dart';

class ModifyUser extends StatefulWidget {
  final bool isEdit;
  const ModifyUser({Key? key, this.isEdit = false}) : super(key: key);

  @override
  _ModifyUserState createState() => _ModifyUserState();
}

class _ModifyUserState extends State<ModifyUser> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.mainBlue,
        title: Text(
          widget.isEdit ? 'Edit User' : 'Create User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
          child: Column(
            children: [
              _InputField(title: 'Name', hint: 'enter your name'),
              const SizedBox(height: 30.0),
              _InputField(
                title: 'Email',
                hint: 'enter your email',
                isEmail: true,
              ),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                style: TextButton.styleFrom(
                  backgroundColor: Pallete.mainBlue,
                  minimumSize: Size(double.infinity, 46.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                child: Text(
                  widget.isEdit ? 'UPDATE' : 'SAVE',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String title;
  final bool isEmail;
  final String hint;

  const _InputField({
    Key? key,
    required this.title,
    this.isEmail = false,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 10.0),
        TextFormField(
          validator: (value) {
            if (isEmail) {
              return EmailValidator.validate(value ?? "")
                  ? null
                  : "Please enter a valid email";
            } else {
              if (value == null || value.isEmpty) {
                return 'Please enter your $title';
              }
              return null;
            }
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0xff4F4F4F),
              fontSize: 14.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Pallete.mainBlue, width: 2.0),
            ),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Pallete.red)),
            contentPadding: EdgeInsets.only(left: 16.0),
          ),
        )
      ],
    );
  }
}
