import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardFavoriteResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

List<Map<String, dynamic>> data = [
  {
    "id": 1,
    "imageUrl": "assets/kfc.png",
    "restoName": "KFC BojongSoang",
    "rate": "4.9",
    "distance": "0.5",
    "place": "Podomor Park"
  },
  {
    "id": 2,
    "imageUrl": "assets/mcd.png",
    "restoName": "MCDonal'ds Podomoro",
    "rate": "4.8",
    "distance": "0.3",
    "place": "Podomor Park"
  },
  {
    "id": 3,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
    "place": "Podomor Park"
  },
  {
    "id": 4,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
    "place": "Podomor Park"
  },
  {
    "id": 5,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
    "place": "Podomor Park"
  },
  {
    "id": 6,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
    "place": "Podomor Park"
  },
  {
    "id": 7,
    "imageUrl": "assets/warunk_mulya.png",
    "restoName": "Warunk Mulya",
    "rate": "4.7",
    "distance": "0.7",
    "place": "Podomor Park"
  },
];

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Favorit",
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 180),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CardFavoriteResto(
                              imageUrl: data[index]["imageUrl"],
                              restoName: data[index]["restoName"],
                              rate: data[index]["rate"],
                              distance: data[index]["distance"],
                              place: data[index]["place"],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
