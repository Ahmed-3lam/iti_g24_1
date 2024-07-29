import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/api_list/cubit/api_list_cubit.dart';

import 'dummy_projects/api_list/api_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return BlocProvider(
      create: (context) => ApiListCubit()..fetchData(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: ApiListScreen(),
      ),
    );
  }
}
