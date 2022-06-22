import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/artikel/detail/isb.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class InfoSeputarBayiPage extends StatefulWidget {
  static const routeName = '/infoseputarbayipage';

  @override
  State<InfoSeputarBayiPage> createState() => _InfoSeputarBayiPageState();
}

final String url = 'http://localhost:8000/api/isb';

Future getISB() async {
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _InfoSeputarBayiPageState extends State<InfoSeputarBayiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Info Seputar Bayi (Artikel)'),
      ),
      body: FutureBuilder(
        future: getISB(),
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
                                          builder: (context) => ISBDetail(
                                            isb: snapshot.data['data'][index],
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
