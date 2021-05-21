import 'package:flutter/material.dart';
import 'login_secreen.dart';
import 'home_screen.dart';
import 'post_details.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          PostDetailsScreen.id: (context) => PostDetailsScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        });
  }
}
