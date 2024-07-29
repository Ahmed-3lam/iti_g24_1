import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/Api_end_points.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/helpers/dummy_dio_helper.dart';

part 'dummy_login_state.dart';

class DummyLoginCubit extends Cubit<DummyLoginState> {
  DummyLoginCubit() : super(DummyLoginInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(DummyLoginLoading());
    try {
      final response =
          await DummyDioHelper.postData(path: ApiEndPoints.login, body: {
        "email": email,
        "password": password,
      });

      if (response.data["status"] == true) {
        emit(DummyLoginSuccess());
      } else {
        emit(DummyLoginError());
      }
    } catch (e) {
      print(e.toString());
      emit(DummyLoginError());
    }
  }
}

/// 3lam.ahmed@gmail.com
/// 123456
