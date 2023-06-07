import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class NearResto extends StatefulWidget {
  const NearResto({super.key});

  @override
  State<NearResto> createState() => _NearRestoState();
}

class _NearRestoState extends State<NearResto> {
  List<String> rates = [
    "4.8",
    "3.5",
    "4.2",
    "4.0",
    "4.6",
    "4.1",
    "4.3",
    "4.0",
    "3.2",
    "3.8"
  ];
  List<String> distances = [
    "0.6",
    "1.2",
    "0.9",
    "0.3",
    "1.6",
    "1.0",
    "1.4",
    "1.9",
    "4.0",
    "2.4"
  ];
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
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Restoran').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data!.docs;
              if (docs.isEmpty) {
                return const Center(
                    child: Text('Tidak ada data restoran yang ditemukan'));
              }
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 270,
                    child: ListView.separated(
                      itemCount: docs.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final resto = docs[index];
                        final rate = rates[index];
                        final distance = distances[index];
                        if (resto['imageUrl'].isEmpty ||
                            resto['username'].isEmpty ||
                            rate.isEmpty ||
                            distance.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardResto(
                                  imageUrl: resto['imageUrl'],
                                  restoName: resto['username'],
                                  rate: rate,
                                  distance: distance, resto: resto.data() as Map<String, dynamic>,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
