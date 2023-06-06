import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardBooking.dart';
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
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Lokasi terkini',
                style: whiteTextStyle.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  const Icon(
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
            const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lihat list booking restoran mu disini",
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: const [
                      CardBooking(
                        imageUrl: 'assets/mcd.png',
                        bookingCode: '#BOOK12495813735',
                        username: 'Jeremia Carlo',
                        date: '10-10-2023',
                        status: 'Pending',
                        textColor: greyColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardBooking(
                        imageUrl: 'assets/mcd.png',
                        bookingCode: '#BOOK21351516575',
                        username: 'Jeremia Carlo',
                        date: '10-10-2023',
                        status: 'Success',
                        textColor: Colors.greenAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardBooking(
                        imageUrl: 'assets/mcd.png',
                        bookingCode: '#BOOK21351516575',
                        username: 'Jeremia Carlo',
                        date: '10-10-2023',
                        status: 'Cancel',
                        textColor: Colors.red,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardBooking(
                        imageUrl: 'assets/mcd.png',
                        bookingCode: '#BOOK21351516575',
                        username: 'Jeremia Carlo',
                        date: '10-10-2023',
                        status: 'Pending',
                        textColor: greyColor,
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
