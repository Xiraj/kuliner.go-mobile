import 'package:flutter/material.dart';

// ignore: camel_case_types
class hargaPage extends StatefulWidget {
  const hargaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _hargaPageState createState() => _hargaPageState();
}

// ignore: camel_case_types
class _hargaPageState extends State<hargaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Kisaran Harga'),
          childrenPadding: EdgeInsets.only(left: 12),
          leading: Icon(Icons.attach_money_outlined),
          children: <Widget>[
            Container(
              child: ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Image(image: AssetImage('assets/dollar.png')),
                ),
                title: Text(
                  '\t | Rp12.000 - Rp199.999',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
