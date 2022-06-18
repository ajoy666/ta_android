import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../profile/profile_page.dart';

class Menu extends StatelessWidget {
  Menu({@required this.icon, this.title, this.cardColor, this.OnTap});

  final String title;
  final IconData icon;
  final Color cardColor;
  final Function OnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: InkWell(
        onTap: () {
          OnTap();
        },
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 50.0,
              ),
              Text(
                title,
                style: new TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
