import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_g24_1/cons.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(imageList[0]),
      ),
    ),
    title: Text(
      "Chats",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Row(
          children: [
            Icon(CupertinoIcons.camera),
            SizedBox(
              width: 30,
            ),
            Icon(CupertinoIcons.app_badge_fill),
          ],
        ),
      ),
    ],
  );
}
