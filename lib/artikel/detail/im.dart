import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utilities/custom_appbar.dart';

class IMDetail extends StatelessWidget {
  final Map im;

  IMDetail({@required this.im});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECA3),
      appBar: BaseAppBar(
        title: Text(im['judul']),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Text(im['isi'], style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
