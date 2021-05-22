import 'package:task_balkis/models/user_info.dart';

class Posts {
  final String id;
  final String text;
  final String imageUrl;
  final int likes;
  final String link;
  final List<dynamic> tags;
  final DateTime publishDate;
  final UserInfo owner;
  Posts(
      {this.id,
      this.text,
      this.imageUrl,
      this.likes,
      this.link,
      this.tags,
      this.publishDate,
      this.owner});
}
