import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'dart:ui';

class Menus extends StatelessWidget {
  Menus({@required this.listColor, this.listIcon, this.listJudul, this.tapTo});

  final Color listColor;
  final String listJudul;
  final Icon listIcon;
  final Function tapTo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          tapTo();
        },
        tileColor: listColor,
        leading: listIcon,
        title: Text(listJudul),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
