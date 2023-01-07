import 'package:api_project/Modules/home_posts/API/Model.dart';
import 'package:api_project/Modules/home_posts/API/api_post.dart';
import 'package:api_project/Modules/home_posts/controller/posts_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final ModelPost? post;
  HomeCubit({this.post}) : super(InitState()) {
    getPost();
    if (post != null) {
      titleController.text = post!.title;
      bodyController.text = post!.body;
    }
  }

  List<ModelPost> myPosts = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  getPost() async {
    Api_class api = Api_class();
    myPosts = await api.getAllPost();
    emit(LoadedState());
  }

  addPost(BuildContext context) async {
    Api_class api_class = Api_class();
    await api_class.addPost(
        title: titleController.text, body: bodyController.text);
    Navigator.pop(context);
    emit(LoadedState());
  }

  updatePost(BuildContext context, {required int id}) async {
    Api_class api_class = Api_class();
    await api_class.updatePost(
        title: titleController.text, body: bodyController.text, id: id);
    Navigator.pop(context);
    emit(LoadedState());
  }

  deletePost({required int id}) async {
    Api_class api_class = Api_class();
    await api_class.deletePost(id: myPosts[id].id);
    myPosts.removeAt(id);
    emit(LoadedState());
  }
}
