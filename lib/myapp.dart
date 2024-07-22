import 'package:flutter/material.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/dummy_login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DummyLoginScreen(),
    );
  }
}
