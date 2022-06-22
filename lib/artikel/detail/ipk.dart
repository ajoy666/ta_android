import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utilities/custom_appbar.dart';

class IPKDetail extends StatelessWidget {
  final Map ipk;

  IPKDetail({@required this.ipk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text(ipk['judul']),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Text(ipk['isi'], style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
