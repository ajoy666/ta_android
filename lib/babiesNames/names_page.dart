import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:ta_android/home_page.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'dart:io';

class NamePage extends StatefulWidget {
  static const routeName = '/namepage';

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Nama Bayi & Arti'),
      ),
    );
  }
}
