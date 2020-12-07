import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarComponent({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      backgroundColor: Color(0XFFFBC02D),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
