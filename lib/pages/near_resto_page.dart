import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class NearResto extends StatelessWidget {
  const NearResto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restoran Terdekat',
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              CardResto(
                imageUrl: 'assets/warunk_mulya.png',
                restoName: "Warunk Mulya Buah Batu",
                rate: "4.8",
                distance: "0.6",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
                imageUrl: 'assets/mcd.png',
                restoName: "McDonald’s Podomoro",
                rate: "4.7",
                distance: "1.5",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
                imageUrl: 'assets/kfc.png',
                restoName: "KFC Bojongsoang",
                rate: "4.9",
                distance: "0.4",
              ),
              SizedBox(
                height: 20,
              ),
              CardResto(
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
