import 'dart:convert';
import 'user_info.dart';
import 'package:task_balkis/models/user_location.dart';
import 'package:task_balkis/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  List<Posts> _post = [];
  List<Posts> get post {
    return _post;
  }

  UserInfo _userInfo;
  UserInfo get userInfo {
    return _userInfo;
  }

  Future<void> postFetching() async {
    final postUrl = 'https://dummyapi.io/data/api/post';
    const app_id = '60a373f57c13e7f5a901a999';
    try {
      final postResponse =
          await http.get(postUrl as Uri, headers: {'app-id': app_id});
      var postData = json.decode(postResponse.body) as Map<String, dynamic>;
      if (postData == null) {
        return;
      }
      List<Posts> loadedList = [];
      for (int i = 0; i < postData.length; i++) {
        loadedList.add(Posts(
          id: postData['data'][i]['id'],
          text: postData['data'][i]['text'],
          imageUrl: postData['data'][i]['image'],
          publishDate: DateTime.parse(postData['data'][i]['publishDate']),
          tags: postData['data'][i]['tags'],
          link: postData['data'][i]['link'],
          likes: postData['data'][i]['likes'],
          owner: UserInfo(
            id: postData['data'][i]['owner']['id'],
            title: postData['data'][i]['owner']['title'],
            email: postData['data'][i]['owner']['email'],
            firstName: postData['data'][i]['owner']['firstName'],
            lastName: postData['data'][i]['owner']['lastName'],
            pictureUrl: postData['data'][i]['owner']['picture'],
          ),
        ));
      }
      _post = loadedList;
      notifyListeners();
      // print(postData);
    } catch (error) {
      print(error);
    }

    // //
    // print(postData);
    // // print(postData['data'][0]['title']);
    // print(postData['data'][0]['owner']['dateOfBirth']);
    // // // print(postData[0]['text']);
    // // // print(loadedList[0].text);
    notifyListeners();
  }

  Future<void> userProfileFetching(String userId) async {
    final userUrl = 'https://dummyapi.io/data/api/user/$userId';
    const app_id = '60a373f57c13e7f5a901a999';
    try {
      final response =
          await http.get(userUrl as Uri, headers: {'app-id': app_id});
      final userData = json.decode(response.body) as Map<String, dynamic>;
      UserInfo loadedData;
      loadedData = UserInfo(
        id: userData['id'],
        title: userData['title'],
        firstName: userData['firstName'],
        lastName: userData['lastName'],
        dateOfBirth: DateTime.parse(userData['dateOfBirth']),
        registerDate: DateTime.parse(userData['registerDate']),
        gender: userData['gender'],
        email: userData['email'],
        phone: userData['phone'],
        pictureUrl: userData['picture'],
        location: UserLocation(
          country: userData['location']['country'],
          state: userData['location']['state'],
          city: userData['location']['city'],
          street: userData['location']['street'],
        ),
      );
      _userInfo = loadedData;
      //
      // print(userData);
      // print(userData['location']['city']);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
