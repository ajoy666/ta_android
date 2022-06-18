import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

class ListTileTrimeseter extends StatelessWidget {
  final Color listColor;
  final String listTitle;

  ListTileTrimeseter({@required this.listColor, this.listTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: listColor,
      onTap: () {},
      subtitle: Padding(
        padding: EdgeInsets.all(9.0),
        child: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Text(
                listTitle ?? "",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}

// class ListTileTrimeseter extends StatefulWidget {
//   final Color listColor;
//   final String listTitle;

//   ListTileTrimeseter({@required this.listColor, this.listTitle});
//   @override
//   State<ListTileTrimeseter> createState() => _ListTileTrimeseterState();
// }

// class _ListTileTrimeseterState extends State<ListTileTrimeseter> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       tileColor: listColor,
//       onTap: () {},
//       subtitle: Padding(
//         padding: EdgeInsets.all(9.0),
//         child: Wrap(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 10.0,
//                 vertical: 10.0,
//               ),
//               child: Text(
//                 listTitle ?? "",
//                 style: TextStyle(color: Colors.white, fontSize: 20.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//       trailing: IconButton(
//         icon: Icon(Icons.keyboard_arrow_right),
//       ),
//     );
//   }
// }
