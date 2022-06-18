import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<IK> fetchIK() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/ik'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return IK.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load IK');
  }
}

class IK {
  final int id;
  final String judul;
  final String isi;
  final String kategori;

  IK({
    this.id,
    this.judul,
    this.isi,
    this.kategori,
  });

  factory IK.fromJson(Map<String, dynamic> json) {
    return IK(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
    );
  }
}

class InfoKehamilanPage extends StatefulWidget {
  static const routeName = '/infokehamilanpage';

  @override
  State<InfoKehamilanPage> createState() => _InfoKehamilanPageState();
}

class _InfoKehamilanPageState extends State<InfoKehamilanPage> {
  Future<IK> futureIK;

  @override
  void initState() {
    super.initState();
    futureIK = fetchIK();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Info Kehamilan (Artikel)'),
      ),
      body: Center(
        child: FutureBuilder<IK>(
          future: futureIK,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.isi ?? '');
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
