import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_android/artikel/Info_menyusui.dart';
import 'package:ta_android/artikel/info_kehamilan.dart';
import 'package:ta_android/artikel/info_pasca_kehamilan.dart';
import 'package:ta_android/artikel/info_seputar_bayi.dart';
import 'package:ta_android/babiesNames/names_page.dart';
import 'package:ta_android/medicalRecord/trimester.dart';
import 'package:ta_android/network/api.dart';
import 'package:ta_android/profile/profile_page.dart';
import 'dart:convert';
import 'login.dart';
import 'package:ta_android/utilities/menuHome.dart';

// import 'package:ta_android/utilities/listTile_trimester.dart';

class Home extends StatefulWidget {
  static const routeName = '/homepage';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        name = user['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: AppBar(
        title: Text('Beranda'),
        backgroundColor: Color(0xFF13603B),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logout();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                    'Hello, ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    '${name}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                children: <Widget>[
                  Menus(
                    listColor: Color(0XFF607C3C),
                    listIcon: Icon(Icons.person),
                    listJudul: 'Profile',
                    tapTo: () {
                      Navigator.of(context).pushNamed(ProfilePage.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFFABC32F),
                    listIcon: Icon(Icons.medical_information),
                    listJudul: 'Laporan Kontrol Ibu Hamil',
                    tapTo: () {
                      Navigator.of(context).pushNamed(Trimester.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFF607C3C),
                    listIcon: Icon(Icons.library_books),
                    listJudul: 'Info Kehamilan',
                    tapTo: () {
                      Navigator.of(context)
                          .pushNamed(InfoKehamilanPage.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFFABC32F),
                    listIcon: Icon(Icons.library_books),
                    listJudul: 'Info Pasca Kehamilan',
                    tapTo: () {
                      Navigator.of(context)
                          .pushNamed(InfoPascaKehamilanPage.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFF607C3C),
                    listIcon: Icon(Icons.library_books),
                    listJudul: 'Info Menyusui',
                    tapTo: () {
                      Navigator.of(context)
                          .pushNamed(InfoMenyusuiPage.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFFABC32F),
                    listIcon: Icon(Icons.library_books),
                    listJudul: 'Info Seputar Bayi',
                    tapTo: () {
                      Navigator.of(context)
                          .pushNamed(InfoSeputarBayiPage.routeName);
                    },
                  ),
                  Menus(
                    listColor: Color(0XFF607C3C),
                    listIcon: Icon(Icons.face),
                    listJudul: 'Nama Bayi & Arti',
                    tapTo: () {
                      Navigator.of(context).pushNamed(NamePage.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.of(context).pushReplacementNamed(Login.routeName);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
