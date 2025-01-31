import 'package:flutter/material.dart';
import 'package:post_app/feature/post/presentation/cubit/post_cubit.dart';
import 'package:post_app/ui/colors.dart';

import '../../../../injection_container.dart';
import '../widget/post_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialColors.backgroundColor,
        body: BlocProvider(
            create: (context) =>
                PostCubit(getIt(), getIt(), getIt(), getIt(), getIt())
                  ..fetchPosts(),
            child: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
              if (state is LoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessState) {
                return PostWidgets(
                  postsList: state.posts,
                  favoriteList: state.favoriteList,
                );
              } else if (state is ErrorState) {
                return Center(child: Text("Error: $state"));
              }
              return Center(child: Text("No data"));
            })));
  }
}
