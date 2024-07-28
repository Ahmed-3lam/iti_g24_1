import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/setting_screen.dart';

part 'image_viewer_state.dart';

class ImageViewerCubit extends Cubit<ImageViewerState> {
  ImageViewerCubit() : super(ImageViewerInitial());

  int imageNum = 1;
  void changeImage() {
    if (imageNum < 3) {
      imageNum++;
    } else {
      imageNum--;
    }
    print(imageNum);

    emit(ImageViewerImageChangedState());
  }

  int index = 0;
  List<Widget> screenItems = [
    HomeScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];
  List<IconData> iconItems = [
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  void changeNav(int i) {
    index = i;
    emit(ImageViewerNavChangedState());
  }
}
