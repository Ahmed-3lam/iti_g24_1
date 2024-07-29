import 'package:bloc/bloc.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/cubit/Api_end_points.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/dummy_dio_helper.dart';
import 'package:meta/meta.dart';

part 'dummy_login_state.dart';

class DummyLoginCubit extends Cubit<DummyLoginState> {
  DummyLoginCubit() : super(DummyLoginInitial());

  void login({
    required String email,
    required String password,
  }) {
    final response = DummyDioHelper.postData(path: ApiEndPoints.login, body: {
      "email": email,
      "password": password,
    });
    print(response);
    if (response != null) {}
  }
}
