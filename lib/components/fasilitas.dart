import 'package:flutter/material.dart';

// ignore: camel_case_types
class fasilitasPage extends StatefulWidget {
  const fasilitasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _fasilitasPageState createState() => _fasilitasPageState();
}

// ignore: camel_case_types
class _fasilitasPageState extends State<fasilitasPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Fasilitas Restoran'),
          leading: Icon(Icons.more_horiz_sharp),
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Image.asset('assets/Fasilitas.png'),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ],
    );
  }
}
