import 'package:flutter/material.dart';

// ignore: camel_case_types
class ulasanPage extends StatefulWidget {
  const ulasanPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ulasanPageState createState() => _ulasanPageState();
}

// ignore: camel_case_types
class _ulasanPageState extends State<ulasanPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Ulasan'),
          leading: Icon(Icons.chat_outlined),
          children: <Widget>[
            Column(
              children: [
                Container(
                  child: Image.asset('assets/ulasan1.png'),
                ),
                Container(
                  child: Image.asset('assets/ulasan2.png'),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
