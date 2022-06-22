import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/artikel/detail/ipk.dart';
import 'package:ta_android/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class InfoPascaKehamilanPage extends StatefulWidget {
  static const routeName = '/infopascakehamilanpage';

  @override
  State<InfoPascaKehamilanPage> createState() => _InfoPascaKehamilanPageState();
}

final String url = 'http://localhost:8000/api/ipk';

Future getIPK() async {
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _InfoPascaKehamilanPageState extends State<InfoPascaKehamilanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Info Pasca Kehamilan (Artikel)'),
      ),
      body: FutureBuilder(
        future: getIPK(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: <Widget>[
                              Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => IPKDetail(
                                            ipk: snapshot.data['data'][index],
                                          ),
                                        ));
                                  },
                                  tileColor: Colors.green,
                                  title: Text(
                                      snapshot.data['data'][index]['judul']),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  );
                });
          } else {
            return Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Data Kosong",
                style: TextStyle(color: Colors.black38),
              ),
            );
          }
        },
      ),
    );
  }
}
