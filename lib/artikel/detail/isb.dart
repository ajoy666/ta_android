import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utilities/custom_appbar.dart';

class ISBDetail extends StatelessWidget {
  final Map isb;

  ISBDetail({@required this.isb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text(isb['judul']),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Text(isb['isi'], style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
