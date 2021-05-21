import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_balkis/screen2/post_model.dart';

class HttpService {
  final String postUrl =
      "https://dummyapi.io/data/60a68b609427f41f890c3328/post";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl as Uri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Cant get post";
    }
  }
}
