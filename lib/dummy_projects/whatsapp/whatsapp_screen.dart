import 'package:flutter/material.dart';

import '../../cons.dart';
import 'models/chat.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> chatList =
        jsonList.map((e) => ChatModel.fromJson(e)).toList();
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _specificChat(
              icon: Icons.lock,
              text: "Locked Chats",
            ),
            SizedBox(
              height: 10,
            ),
            _specificChat(
              icon: Icons.archive,
              text: "Archive Chats",
              isCountVisable: true,
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: chatList.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(.2),
              ),
              itemBuilder: (context, index) => _buildChatItem(
                name: chatList[index].name!,
                message: chatList[index].message!,
                image: chatList[index].image!,
                createdAt: chatList[index].createdAt!,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.messenger,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String image,
    required String createdAt,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Spacer(),
        Text(
          createdAt,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _specificChat({
    required IconData icon,
    required String text,
    bool isCountVisable = false,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        SizedBox(
          width: 10,
        ),
        Text(text),
        Spacer(),
        if (isCountVisable) Text("1")
      ],
    );
  }
}

Widget _buildMyActionsItem(
  IconData? icon,
) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}

AppBar _appBar() {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.green,
    title: Text(
      "WhatsApp",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      _buildMyActionsItem(Icons.camera_alt_outlined),
      _buildMyActionsItem(Icons.search),
      _buildMyActionsItem(Icons.more_vert),
    ],
  );
}

List<Map> jsonList = [
  {
    "id": 548,
    "name": "Ahmed",
    "message": "Hello From",
    "image": imageList[0],
    "createdAt": "9:30 AM",
  },
  {
    "id": 548,
    "name": "MMMM",
    "message": "Hello From",
    "image": imageList[1],
    "createdAt": "9:30 AM",
  },
  {
    "id": 548,
    "name": "FFFF",
    "message": "Hello From",
    "image": imageList[2],
    "createdAt": "9:30 AM",
  },
  {
    "id": 548,
    "name": "Ahmed",
    "message": "Hello From",
    "image": imageList[2],
    "createdAt": "9:30 AM",
  }
];
