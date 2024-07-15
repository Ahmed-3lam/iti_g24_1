import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: Icon(
            Icons.close,
            size: 40,
            color: Colors.blue,
          ),
          title: Text(
            "Hello",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            Icon(
              Icons.archive,
              color: Colors.blue,
            )
          ],
          centerTitle: true,
        ),
      ),
    );
  }
}
