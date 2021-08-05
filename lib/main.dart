import 'package:flutter/material.dart';
import 'package:flutter_api/screens/home_screen.dart';
import 'package:flutter_api/services/user_service.dart';
import 'package:get_it/get_it.dart';

//add
void serviceLocator() {
  GetIt.instance.registerLazySingleton(() => UserService());
}

//update
void main() {
  serviceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
