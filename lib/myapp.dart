import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/note_app/cubit/note_cubit.dart';
import 'package:iti_g24_1/dummy_projects/note_app/note_app_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return BlocProvider(
      create: (context) => NoteCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NoteAppScreen(),
      ),
    );
  }
}
