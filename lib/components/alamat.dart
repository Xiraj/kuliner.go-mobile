import 'package:flutter/material.dart';

// ignore: camel_case_types
class alamatPage extends StatefulWidget {
  const alamatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _alamatPageState createState() => _alamatPageState();
}

// ignore: camel_case_types
class _alamatPageState extends State<alamatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Alamat Restoran'),
          childrenPadding: EdgeInsets.only(left: 12),
          leading: Icon(Icons.location_on),
          children: <Widget>[
            Center(
              child: Image.asset('assets/map.png'),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Container(
                  width: 520,
                  padding: EdgeInsets.only(left: 40, right: 30),
                  child: Text(
                    'Jl. Raya Bojongsoang No. 80, Lengkong, Kec. Bojongsoang, Kab. Bandung, Jawa Barat 40287',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ],
    );
  }
}
