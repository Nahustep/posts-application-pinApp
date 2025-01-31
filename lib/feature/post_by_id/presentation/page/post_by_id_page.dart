import 'package:flutter/material.dart';
import 'package:post_app/ui/colors.dart';

import '../../../../../injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_by_id_cubit.dart';
import '../widget/post_by_id_widget.dart';

class PostDetailPage extends StatelessWidget {
  final String id;
  const PostDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialColors.backgroundColor,
        body: BlocProvider.value(
            value: getIt<PostDetailCubit>()..fetchPost(id),
            child: BlocBuilder<PostDetailCubit, PostDetailState>(
                builder: (context, state) {
              if (state is LoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessState) {
                return PostDetailWidget(
                  post: state.post,
                  comments: state.comments,
                );
              } else if (state is ErrorState) {
                return Center(child: Text("Error: ${state.error}"));
              }
              return Center(child: Text("No data"));
            })));
  }
}
