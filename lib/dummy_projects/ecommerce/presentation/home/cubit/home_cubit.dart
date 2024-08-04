import 'package:bloc/bloc.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/model/banner_model.dart';
import 'package:meta/meta.dart';

import '../../../helpers/api_const.dart';
import '../../../helpers/api_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  BannerModel bannerModel = BannerModel();

  void getbanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await ApiHelper.instance.get(
        ApiConst.BANNER,
      );
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }
}
