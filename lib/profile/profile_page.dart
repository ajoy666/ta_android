import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // List profileList = List();

  // getProfile() async {
  //   var response = await http.get(("url"));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       profileList = json.decode(response.body);
  //     });
  //     return profileList;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Profil'),
      ),
    );
  }
}
