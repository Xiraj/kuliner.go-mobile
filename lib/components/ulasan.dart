import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardReview.dart';

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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CardReview(
                    imageUrl: 'assets/prof.png',
                    username: 'Alexander Yupo',
                    comments:
                        '“Penjual sangat ramah bintang 5, makanannya juga enak, harganya sangat cocok untuk kantong kita, cocok buat makan sama ayang, mantap pol!!”',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CardReview(
                    imageUrl: 'assets/prof2.png',
                    username: 'Charlie Van Houten',
                    comments:
                        '“Rasa makanannya enak banget, seperti buatan bunda, cocok buat yang homesick contohnya saya, ehhe”',
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
