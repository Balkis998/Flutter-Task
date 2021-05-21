import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_balkis/screen2/posts.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PostsPage();
  }
}
