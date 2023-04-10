import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class PopularResto extends StatefulWidget {
  const PopularResto({super.key});

  @override
  State<PopularResto> createState() => _PopularRestoState();
}

List<Map<String, dynamic>> data = [
  {
    "id": 1,
    "imageUrl": "assets/kfc.png",
    "restoName": "KFC BojongSoang",
    "rate": "4.9",
    "distance": "0.5",
  },
  {
    "id": 2,
    "imageUrl": "assets/mcd.png",
    "restoName": "MCDonal'ds Podomoro",
    "rate": "4.8",
    "distance": "0.3",
  },
  {
    "id": 3,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
  },
];

class _PopularRestoState extends State<PopularResto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restoran Terpopular',
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CardResto(
                    imageUrl: data[index]["imageUrl"],
                    restoName: data[index]["restoName"],
                    rate: data[index]["rate"],
                    distance: data[index]["distance"],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
