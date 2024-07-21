import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchField() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    padding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    height: 50,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Search",
          style: TextStyle(color: Colors.grey),
        )
      ],
    ),
  );
}
