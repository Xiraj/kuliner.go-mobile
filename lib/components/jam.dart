import 'package:flutter/material.dart';

const List<String> jadwal = [
  'senin    00.00 - 23.59',
  'selasa   00.00 - 23.59',
  'rabu     00.00 - 23.59',
  'kamis    00.00 - 23.59',
  'jumat    00.00 - 23.59',
  'sabtu    00.00 - 23.59',
  'minggu   00.00 - 23.59'
];

// ignore: camel_case_types
class jamPage extends StatefulWidget {
  const jamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _jamPageState createState() => _jamPageState();
}

// ignore: camel_case_types
class _jamPageState extends State<jamPage> {
  String dropdownValue = jadwal.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Jam Buka'),
          childrenPadding: EdgeInsets.only(left: 12),
          leading: Icon(Icons.access_time),
          children: <Widget>[
            Column(
              children: [
                Image.asset('assets/jadwal.png'),
                SizedBox(
                  height: 12,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
