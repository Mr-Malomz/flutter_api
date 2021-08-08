import 'package:flutter/material.dart';
import 'package:flutter_api/models/api_response.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/services/user_service.dart';
import 'package:flutter_api/widgets/user_card.dart';
import 'package:get_it/get_it.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //add
  UserService get service => GetIt.instance<UserService>();

  APIResponse<List<User>>? _response;
  bool _isLoading = false;
  int? userCount;

  @override
  void initState() {
    _fetchUser();
    super.initState();
  }

  _fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    _response = await service.getAllUsers();

    setState(() {
      _isLoading = false;
      userCount = _response!.data!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              itemCount: _response!.data!.length,
              itemBuilder: (context, index) {
                final User user = _response!.data![index];
                return UserCard(user: user);
              });
        },
      ),
    );
  }
}
