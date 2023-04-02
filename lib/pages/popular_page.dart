import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardNearResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class PopularResto extends StatelessWidget {
  const PopularResto({super.key});

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
          child: ListView(
            children: [
              CardNearResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardNearResto(
                imageUrl: 'assets/warunk_mulya.png',
                restoName: "Warunk Mulya Buah Batu",
                rate: "4.8",
                distance: "0.6",
              ),
              SizedBox(
                height: 20,
              ),
              CardNearResto(
                imageUrl: 'assets/mcd.png',
                restoName: "McDonald’s Podomoro",
                rate: "4.7",
                distance: "1.5",
              ),
              SizedBox(
                height: 20,
              ),
              CardNearResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardNearResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardNearResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
