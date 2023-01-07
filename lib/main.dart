import 'package:api_project/Modules/home_posts/view/home_posts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home_posts(),
      debugShowCheckedModeBanner: false,
    );
  }
}
