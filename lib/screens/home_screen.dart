import 'package:flutter/material.dart';
import 'package:flutter_api/models/api_response.dart';
import 'package:flutter_api/models/user_model.dart';
import 'package:flutter_api/screens/modify_user.dart';
import 'package:flutter_api/services/user_service.dart';
import 'package:flutter_api/utils/pallete.dart';
import 'package:flutter_api/widgets/user_card.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Pallete.mainBlue,
            title: Text(
              'Users',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModifyUser(),
                      ));
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
                label: Text(
                  'Add new',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          //modify this block
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              final User user = _response!.data![index];

              if (_isLoading) {
                return CircularProgressIndicator();
              }

              if (_response!.isError) {
                return Center(
                  child: Text(_response!.errorMessage.toString()),
                );
              }

              return UserCard(user: user);
            }),
          ),
        ],
      ),
    );
  }
}
