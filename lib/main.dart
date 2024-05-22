import 'package:dars_1_uy_ishi/views/screens/contact_screen.dart';
import 'package:dars_1_uy_ishi/views/screens/todo_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoScreen(),
    );
  }
}
