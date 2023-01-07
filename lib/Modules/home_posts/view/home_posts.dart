import 'package:api_project/Modules/edit_Screen/view/editScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controller/posts_cubit.dart';
import '../controller/posts_state.dart';

class Home_posts extends StatefulWidget {
  const Home_posts({Key? key}) : super(key: key);

  @override
  State<Home_posts> createState() => _Home_postsState();
}

class _Home_postsState extends State<Home_posts> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit controller = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EditScreen())));
                  },
                  icon: Icon(CupertinoIcons.add)),
              IconButton(
                  onPressed: () {
                    //  controller.deletePost();
                  },
                  icon: Icon(CupertinoIcons.delete)),
              IconButton(
                  onPressed: () {
                    //controller.updatePost();
                  },
                  icon: Icon(CupertinoIcons.upload_circle))
            ]),
            backgroundColor: Colors.black26,
            body: Container(
              child: ListView.builder(
                  itemCount: controller.myPosts.length,
                  itemBuilder: ((context, index) {
                    return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),
                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) {
                                controller.deletePost(id: index);
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => EditScreen(
                                              posts: controller.myPosts[index],
                                            ))));
                                //   controller.updatePost(id: index);
                              },
                              backgroundColor: Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: CupertinoIcons.arrow_2_squarepath,
                              label: 'update',
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              )),
                          child: Column(
                            children: [
                              Text(
                                controller.myPosts[index].title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.myPosts[index].body,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ));
                  })),
            ),
          );
        },
      ),
    );
  }
}
