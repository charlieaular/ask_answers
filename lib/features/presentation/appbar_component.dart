import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarComponent({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title) : null,
      backgroundColor: Color(0XFF283593),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
