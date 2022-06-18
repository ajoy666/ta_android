import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/babiesNames/names_page.dart';
import 'package:ta_android/infoKehamilan/info_kehamilan.dart';
import 'package:ta_android/medicalRecord/trimester_page.dart';
import 'package:ta_android/profile/profile_page.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:ta_android/utilities/menu.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(
      //   title: Text('Beranda'),
      // ),
      backgroundColor: Colors.green[100],
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            Menu(
              icon: Icons.person,
              title: 'Profil',
              cardColor: Color(0XFF9EB23B),
              OnTap: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
            ),
            Menu(
              icon: Icons.medical_information,
              title: 'Laporan Kontrol',
              cardColor: Color(0XFFC7D36F),
              OnTap: () {
                Navigator.of(context).pushNamed(TrimesterPage.routeName);
              },
            ),
            Menu(
              icon: Icons.library_books,
              title: 'Info Kehamilan',
              cardColor: Color(0XFF6CC4A1),
              OnTap: () {
                Navigator.of(context).pushNamed(InfoKehamilanPage.routeName);
              },
            ),
            Menu(
              icon: Icons.library_books,
              title: 'Info Pasca Kehamilan',
              cardColor: Color(0XFF4CACBC),
              OnTap: () {
                Navigator.of(context).pushNamed(TrimesterPage.routeName);
              },
            ),
            Menu(
              icon: Icons.library_books,
              title: 'Info Menyusui',
              cardColor: Color(0XFF809A6F),
              OnTap: () {
                Navigator.of(context).pushNamed(TrimesterPage.routeName);
              },
            ),
            Menu(
              icon: Icons.library_books,
              title: 'Info Seputar Bayi',
              cardColor: Color(0XFF82A284),
              OnTap: () {
                Navigator.of(context).pushNamed(TrimesterPage.routeName);
              },
            ),
            Menu(
              icon: Icons.face,
              title: 'Daftar Arti Nama',
              cardColor: Color(0XFFE4AEC5),
              OnTap: () {
                Navigator.of(context).pushNamed(NamePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
