import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'dummy_projects/dummy_login/cubit/dummy_login_cubit.dart';
import 'dummy_projects/dummy_login/dummy_login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return BlocProvider(
      create: (context) => DummyLoginCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: DummyLoginScreen(),
      ),
    );
  }
}
