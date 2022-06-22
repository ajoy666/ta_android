import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'dart:io';

import '../utilities/menuHome.dart';

class Trimester extends StatefulWidget {
  static const routeName = '/trimesterpage';

  @override
  State<Trimester> createState() => _TrimesterState();
}

class _TrimesterState extends State<Trimester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Trimester'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Menus(
            listColor: Color(0XFF607C3C),
            listIcon: Icon(Icons.library_books),
            listJudul: 'Trimester 1',
            tapTo: () {},
          ),
          Menus(
            listColor: Color(0XFFABC32F),
            listIcon: Icon(Icons.library_books),
            listJudul: 'Trimester 2',
            tapTo: () {},
          ),
          Menus(
            listColor: Color(0XFF607C3C),
            listIcon: Icon(Icons.library_books),
            listJudul: 'Trimester 3',
            tapTo: () {},
          ),
        ],
      ),
    );
  }
}
