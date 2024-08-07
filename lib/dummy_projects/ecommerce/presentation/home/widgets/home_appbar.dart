import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(.2),
          radius: 12,
          child: Icon(Icons.more_vert_outlined),
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.location_solid,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Current Location",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      CupertinoIcons.chevron_compact_down,
                      color: Colors.green,
                    )
                  ],
                ),
                Text(
                  "Menouf , El Menoufia",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(CupertinoIcons.search),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
