import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../post_model.dart';

part 'api_list_state.dart';

class ApiListCubit extends Cubit<ApiListState> {
  ApiListCubit() : super(ApiListInitial());

  List<PostModel> myList = [];
  final dio = Dio();

  Future fetchData() async {
    emit(ApiListLoading());
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );
      if (response.statusCode == 200) {
        List tempList = response.data;
        myList = tempList.map((e) => PostModel.fromJson(e)).toList();
        await Future.delayed(const Duration(seconds: 4));
        emit(ApiListSuccess());
      } else {
        emit(ApiListError());
      }
    } catch (e) {}
  }
}
