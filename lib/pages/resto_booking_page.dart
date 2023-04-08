import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RestoBookingList extends StatefulWidget {
  const RestoBookingList({super.key});

  @override
  State<RestoBookingList> createState() => _RestoBookingListState();
}

class _RestoBookingListState extends State<RestoBookingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Lokasi terkini',
                style: whiteTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: whiteColor,
                    size: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Bojongsoang",
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking",
                    style: whiteTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lihat list booking restoran mu disini",
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "List Booking",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
