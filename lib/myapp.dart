import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/image_viewer/cubit/image_viewer_cubit.dart';

import 'dummy_projects/image_viewer/screens/image_viewer_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return BlocProvider(
      create: (context) => ImageViewerCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageViewerScreen(),
      ),
    );
  }
}
