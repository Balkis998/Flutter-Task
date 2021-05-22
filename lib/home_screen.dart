import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_balkis/login_secreen.dart';
import 'package:task_balkis/widgets/post_widget.dart';
import 'package:provider/provider.dart';
import 'models/post-provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context);
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return LoginScreen();
            }
            return HomeScreen();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Posts'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          postData.postFetching();
                        });
                      })
                ],
              ),
              body:
                  // Center(child: Text('fffffff')),
                  ListView.builder(
                      itemCount: postData.post.length,
                      itemBuilder: (cxt, index) {
                        return PostWidget(
                          id: postData.post[index].owner.id,
                          firstName: postData.post[index].owner.firstName,
                          lastName: postData.post[index].owner.lastName,
                          pictureUrl: postData.post[index].owner.pictureUrl,
                          title: postData.post[index].owner.title,
                          email: postData.post[index].owner.email,
                          imageUrl: postData.post[index].imageUrl,
                          tags: postData.post[index].tags,
                          text: postData.post[index].text,
                          likes: postData.post[index].likes,
                          publishDate: postData.post[index].publishDate,
                        );
                      }),
            );
          }
        });
  }
}
