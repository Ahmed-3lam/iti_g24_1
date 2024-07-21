import 'package:flutter/material.dart';

Widget buildStatusItem(String image) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(image),
          ),
        ),
      ),
      CircleAvatar(
        radius: 10,
        backgroundColor: Colors.white,
      ),
      CircleAvatar(
        radius: 8,
        backgroundColor: Colors.green,
      ),
    ],
  );
}
