import 'package:bloc/bloc.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/api_const.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/api_helper.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'package:meta/meta.dart';

import '../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await ApiHelper.instance.post(
        url: ApiConst.LOGIN,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        HiveHelper.saveToken(loginModel.data!.token!);
        emit(LoginSuccess(loginModel.message!));
      } else {
        emit(LoginError(loginModel.message!));
      }
    } catch (e) {
      emit(LoginError("An error occurred"));
    }
  }
}
