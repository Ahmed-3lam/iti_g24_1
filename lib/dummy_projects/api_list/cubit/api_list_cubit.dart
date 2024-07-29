import 'package:bloc/bloc.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/Api_end_points.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/dummy_dio_helper.dart';
import 'package:meta/meta.dart';

import '../post_model.dart';

part 'api_list_state.dart';

class ApiListCubit extends Cubit<ApiListState> {
  ApiListCubit() : super(ApiListInitial());

  List<PostModel> myList = [];

  Future fetchData() async {
    emit(ApiListLoading());
    try {
      final response = await DummyDioHelper.getData(path: ApiEndPoints.apiList);
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
