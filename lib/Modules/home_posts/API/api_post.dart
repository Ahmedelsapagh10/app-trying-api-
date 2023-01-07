import 'dart:convert';

import 'package:api_project/Modules/home_posts/API/Model.dart';
import 'package:dio/dio.dart';

class Api_class {
  Future<List<ModelPost>> getAllPost() async {
    Dio dio = Dio();

    Response respons =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    return respons.data
        .map((post) => ModelPost.fromJson(post))
        .toList()
        .cast<ModelPost>();
  }

  Future<void> addPost({required String title, required String body}) async {
    Dio dio = Dio();
    Response s = await dio.post('https://jsonplaceholder.typicode.com/posts',
        data: json.encode({
          'title': title,
          'body': body,
          'userId': '1',
        }));
    print('Insert Posts..................');
    print(s.data);
  }

  Future<void> updatePost(
      {required String title, required String body, required int id}) async {
    Dio dio = Dio();
    Response s = await dio.put('https://jsonplaceholder.typicode.com/posts/$id',
        data: json.encode(
          {
            'title': title,
            'body': body,
            'userId': '4',
          },
        ));
    print('Updated Posts..................');
    print(s.data);
  }

  Future<void> deletePost({required int id}) async {
    Dio dio = Dio();
    Response s = await dio.delete(
      'https://jsonplaceholder.typicode.com/posts/$id',
    );
    print('deleted Posts..................');
    print(s.data);
  }
}
