import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_balkis/models/post-provider.dart';
import 'package:task_balkis/post_details.dart';

class PostWidget extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String pictureUrl;
  final String title;
  final String text;
  final String email;
  final String imageUrl;
  final List<dynamic> tags;
  final int likes;
  final DateTime publishDate;
  final String comment;
  final String profile;
  PostWidget({
    this.id,
    this.pictureUrl,
    this.title,
    this.likes,
    this.imageUrl,
    this.tags,
    this.publishDate,
    this.email,
    this.comment,
    this.profile,
    this.text,
    this.lastName,
    this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostProvider>(context);
    return Container(
      height: 600,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(pictureUrl),
                radius: 30,
              ),
              title: Text(firstName + lastName),
              subtitle: Text(email),
            ),
            Divider(),
            Container(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              height: 250,
              width: double.infinity,
              color: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(
                  label: Text(tags[0]),
                  backgroundColor: Colors.pink,
                ),
                SizedBox(
                  width: 5,
                ),
                Chip(
                  label: Text(tags[1]),
                  backgroundColor: Colors.pink,
                ),
                SizedBox(
                  width: 5,
                ),
                Chip(
                  label: Text(tags[2]),
                  backgroundColor: Colors.pink,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Text(text),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(likes.toString()),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(publishDate.toString()),
                )
              ],
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.favorite,
            //     color: Colors.blue,
            //   ),
            //   title: Text(likes.toString()),
            //   trailing: Text(publishDate.toString()),
            // ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PostDetailsScreen.id);
                  },
                  child: Text(
                    'go to profile',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  textColor: Colors.blue,
                ),
                FlatButton(
                  onPressed: () {
                    print(postData.post[0].text);
                  },
                  child: Text(
                    'go to comments',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  textColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
