import 'package:api_project/Modules/home_posts/API/Model.dart';
import 'package:api_project/Modules/home_posts/controller/posts_cubit.dart';
import 'package:api_project/Modules/home_posts/controller/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key, this.posts}) : super(key: key);
  final ModelPost? posts;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(post: posts),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit controller = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(posts != null ? 'Update Post' : 'Insert New Post'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.titleController,
                    decoration: InputDecoration(
                        hintText: 'Enter your title',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ))),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  TextFormField(
                    controller: controller.bodyController,
                    decoration: InputDecoration(
                        hintText: 'Enter your body',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ))),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          posts != null ? 'Update Post' : 'Insert New Post',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                    onTap: () {
                      posts != null
                          ? controller.updatePost(
                              context,
                              id: posts!.id,
                            )
                          : controller.addPost(context);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
