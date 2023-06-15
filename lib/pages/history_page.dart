import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';

import '../components/cardBooking.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riwayat",
                      style: whiteTextStyle.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
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
                  children: [
                    const SizedBox(height: 10),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Booking')
                          .where('userId',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/notAvailable.png',
                                width: 169,
                                height: 245,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Kamu belum pernah pesan\ntempat di resto manapun',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Silahkan pesan restoran favoritmu\ndan kembali lagi kesini',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 190,
                              ),
                            ],
                          );
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
