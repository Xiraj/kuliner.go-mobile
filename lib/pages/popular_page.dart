import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/theme.dart';

class PopularResto extends StatefulWidget {
  const PopularResto({super.key});

  @override
  State<PopularResto> createState() => _PopularRestoState();
}

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
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Restoran').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data!.docs;
              if (docs.isEmpty) {
                return Center(
                    child: Text('Tidak ada data restoran yang ditemukan'));
              }
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 270,
                    child: ListView.separated(
                      itemCount: docs.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final resto = docs[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardResto(
                                  imageUrl: resto['imageUrl'],
                                  restoName: resto['username'],
                                  rate: "4.8",
                                  distance: "0.6",
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
