import 'package:flutter/material.dart';

// ignore: camel_case_types
class pembayaranPage extends StatefulWidget {
  const pembayaranPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _pembayaranPageState createState() => _pembayaranPageState();
}

// ignore: camel_case_types
class _pembayaranPageState extends State<pembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Debit Card'),
          childrenPadding: EdgeInsets.only(left: 12),
          leading: Icon(
            Icons.wallet_outlined,
          ),
          children: <Widget>[
            Container(
              child: ListTile(
                leading: Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Image.asset('assets/Mandiri.png')),
                title: Text(
                  'Mandiri',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Bayar di tempat'),
          childrenPadding: EdgeInsets.only(left: 12),
          leading: Icon(
            Icons.payments_outlined,
          ),
          children: <Widget>[
            Container(
              child: ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Icon(Icons.person_pin_rounded),
                ),
                title: Text(
                  'Pastikan kamu membawa uang cash dengan harga yang tertera.',
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
