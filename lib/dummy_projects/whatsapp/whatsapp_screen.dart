import 'package:flutter/material.dart';

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Row(
            //   children: [
            //     Icon(
            //       Icons.archive,
            //       color: Colors.green,
            //     ),
            //     Text(" Archive Chats"),
            //     Spacer(),
            //     Text("1")
            //   ],
            // ),
          ],
        ),
      ),
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
