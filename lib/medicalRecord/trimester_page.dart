import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/home_page.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:ta_android/utilities/listTile_trimester.dart';
import 'dart:io';

class TrimesterPage extends StatefulWidget {
  static const routeName = '/trimesterpage';

  @override
  State<TrimesterPage> createState() => _TrimesterState();
}

class _TrimesterState extends State<TrimesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Trimester'),
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTileTrimeseter(
              listColor: Color(0XFFC7D36F),
              listTitle: 'Trimester 1',
            ),
            ListTileTrimeseter(
              listColor: Color(0XFF809A6F),
              listTitle: 'Trimester 2',
            ),
            ListTileTrimeseter(
              listColor: Color(0XFFC7D36F),
              listTitle: 'Trimester 3',
            ),
          ],
        ),
      ),
    );
  }
}
