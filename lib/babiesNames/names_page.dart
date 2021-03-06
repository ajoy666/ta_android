import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class NamePage extends StatefulWidget {
  static const routeName = '/namepage';

  @override
  State<NamePage> createState() => _NamePageState();
}

final String url = 'http://localhost:8000/api/bn';

Future getBN() async {
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Nama Bayi & Arti'),
      ),
      body: FutureBuilder(
        future: getBN(),
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
                                  tileColor: Colors.green,
                                  title: Text(
                                      snapshot.data['data'][index]['nama']),
                                  subtitle: Text(
                                      snapshot.data['data'][index]['arti']),
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
