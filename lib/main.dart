// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:ta_android/babiesNames/names_page.dart';
// import 'package:ta_android/infoKehamilan/info_kehamilan.dart';
// import 'login_page.dart';
// import 'home_page.dart';
// import 'profile/profile_page.dart';
// import 'medicalRecord/trimester_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//       // initialRoute: HomePage.routeName,
//       routes: {
//         HomePage.routeName: (context) => HomePage(),
//         LoginPage.routeName: (context) => LoginPage(),
//         ProfilePage.routeName: (context) => ProfilePage(),
//         TrimesterPage.routeName: (context) => TrimesterPage(),
//         NamePage.routeName: (context) => NamePage(),
//         InfoKehamilanPage.routeName: (context) => InfoKehamilanPage(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'artikel/info_kehamilan.dart';
import 'artikel/info_pasca_kehamilan.dart';
import 'artikel/info_menyusui.dart';
import 'artikel/info_seputar_bayi.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'profile/profile_page.dart';
import 'medicalRecord/trimester.dart';
import 'babiesNames/names_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
      routes: {
        Home.routeName: (context) => Home(),
        Login.routeName: (context) => Login(),
        InfoKehamilanPage.routeName: (context) => InfoKehamilanPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        Trimester.routeName: (context) => Trimester(),
        NamePage.routeName: (context) => NamePage(),
        InfoPascaKehamilanPage.routeName: (context) => InfoPascaKehamilanPage(),
        InfoMenyusuiPage.routeName: (context) => InfoMenyusuiPage(),
        InfoSeputarBayiPage.routeName: (context) => InfoSeputarBayiPage(),
      },
      darkTheme: ThemeData(
          brightness: Brightness.dark, accentColor: Colors.blueAccent),
      themeMode: ThemeMode.dark,
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      child = Login();
    }

    return Scaffold(
      body: child,
    );
  }
}
