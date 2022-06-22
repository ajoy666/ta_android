import 'package:flutter/material.dart';
import 'dart:io';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;

  // final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Color(0xFF13603B),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
