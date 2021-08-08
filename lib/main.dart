import 'package:flutter/material.dart';
import 'package:flutter_api/screens/todos_screen.dart';
import 'package:flutter_api/screens/user_screen.dart';
import 'package:flutter_api/utils/pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  List<Widget> _screens = [HomeScreen(), TodoScreen()];

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Todos',
            ),
          ],
          selectedItemColor: Pallete.mainBlue,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
