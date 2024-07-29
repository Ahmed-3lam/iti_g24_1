import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_g24_1/dummy_projects/api_list/cubit/api_list_cubit.dart';

class ApiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ApiListCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ApiListCubit, ApiListState>(
        builder: (context, state) {
          if (state is ApiListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApiListError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return ListView.separated(
              itemCount: cubit.myList.length,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (c, i) => const Divider(),
              itemBuilder: (c, i) =>
                  Center(child: Text(cubit.myList[i].title!)));
        },
      ),
    );
  }
}

/// method get
/// path: https://jsonplaceholder.typicode.com/posts
/// no params no body
/// no headers
