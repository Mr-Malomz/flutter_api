import 'package:flutter/material.dart';
import 'package:flutter_api/utils/pallete.dart';
import 'package:flutter_api/widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                onPressed: () => print('new'),
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
          SliverList(
            delegate: SliverChildListDelegate([
              UserCard(),
            ]),
          ),
        ],
      ),
    );
  }
}
