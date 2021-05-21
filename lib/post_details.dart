import 'package:flutter/material.dart';
import 'package:task_balkis/screen2/post_model.dart';

class PostDetailsScreen extends StatefulWidget {
  static const String id = 'post_details_screen';

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen>
    with SingleTickerProviderStateMixin {
  final Post post;
  MaterialColor _color;

  _PostDetailsScreenState({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Title'),
                subtitle: Text(post.title),
              ),
              ListTile(
                title: Text('ID'),
                subtitle: Text('${post.id}'),
              ),
              ListTile(
                title: Text('Body'),
                subtitle: Text(post.body),
              ),
              ListTile(
                title: Text('User ID'),
                subtitle: Text('${post.userId}'),
              ),
              ElevatedButton(
                child: Text(
                  'Mark as read',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _color = Colors.blueGrey;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20))),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
