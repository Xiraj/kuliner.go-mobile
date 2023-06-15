import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              height: MediaQuery.of(context).size.height + 110,
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
                    children: [
                      const SizedBox(height: 10),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Booking')
                            .where('restoId',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          List<QueryDocumentSnapshot> bookingList =
                              snapshot.data!.docs;

                          if (bookingList.isEmpty) {
                            return const Center(
                              child: Text('Belum ada yang melakukan booking'),
                            );
                          }

                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              itemCount: bookingList.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> bookingData =
                                    bookingList[index].data()
                                        as Map<String, dynamic>;

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: CardBooking(
                                    imageUrl: 'assets/ticket.png',
                                    bookingCode: bookingData['bookingId'],
                                    username: bookingData['name'],
                                    date: bookingData['selectedDate'],
                                    people: bookingData['people'],
                                    time: bookingData['selectedTime'],
                                  ),
                                );
                              },
                            ),
                          );
                        },
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
