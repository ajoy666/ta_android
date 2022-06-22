import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta_android/artikel/detail/ik.dart';
import 'package:ta_android/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_android/utilities/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class InfoKehamilanPage extends StatefulWidget {
  static const routeName = '/infokehamilanpage';

  @override
  State<InfoKehamilanPage> createState() => _InfoKehamilanPageState();
}

final String url = 'http://localhost:8000/api/ik';

Future getIK() async {
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _InfoKehamilanPageState extends State<InfoKehamilanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text('Info Kehamilan (Artikel)'),
      ),
      body: FutureBuilder(
        future: getIK(),
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
                                          builder: (context) => IKDetail(
                                            ik: snapshot.data['data'][index],
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
      // body: SafeArea(
      //   child: Container(
      //     padding: EdgeInsets.all(15),
      //     child: ListView(
      //       children: [
      //         SizedBox(
      //           height: 24,
      //         ),
      //         Text(
      //           "Daftar Artikel",
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(
      //           height: 12,
      //         ),
      //         articles(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

// Table articles() {
//   return Table(
//     border: TableBorder(
//       horizontalInside: BorderSide(
//         width: 1,
//         color: Colors.grey,
//       ),
//     ),
//     children: [
//       TableRow(children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: Text(
//             "ID",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: Text(
//             "FULL NAME",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: Text(
//             "OPTION",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ]),
//       for (Article article in aarticle)
//         TableRow(children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//             child: Text(
//               "${article.isi}",
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//             child: Text(
//               "${article.kategori}",
//             ),
//           ),
//           FlatButton(
//             child: Icon(
//               Icons.chevron_right,
//               color: Colors.blue,
//             ),
//             onPressed: () {
//               // Navigator.push(context,
//               // MaterialPageRoute(builder: (context)=> DetailStudent(student: student,))
//               // );
//             },
//           ),
//         ]),
//     ],
//   );
// }
