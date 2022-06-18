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
      appBar: BaseAppBar(
        title: Text('Profil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'profile',
            style: TextStyle(fontSize: 30.0),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('<<back'),
          ),
        ],
      ),
    );
  }
}
