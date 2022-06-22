import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utilities/custom_appbar.dart';

class IKDetail extends StatelessWidget {
  final Map ik;

  IKDetail({@required this.ik});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text(ik['judul']),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Text(ik['isi'], style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
