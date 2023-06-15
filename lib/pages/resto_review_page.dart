import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardReview.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RestoReviewList extends StatefulWidget {
  const RestoReviewList({super.key});

  @override
  State<RestoReviewList> createState() => _RestoReviewListState();
}

String getTimeAgo(dynamic timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime uploadTime = (timestamp as Timestamp).toDate();

  Duration difference = currentTime.difference(uploadTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  } else if (difference.inHours < 1) {
    int minutes = difference.inMinutes;
    return '$minutes minute${minutes > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 1) {
    int hours = difference.inHours;
    return '$hours hour${hours > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 7) {
    int days = difference.inDays;
    return '$days day${days > 1 ? 's' : ''} ago';
  } else {
    return uploadTime.toString();
  }
}

class _RestoReviewListState extends State<RestoReviewList> {
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
                    "Review",
                    style: whiteTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lihat review restoran mu disini",
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
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Review Restoran",
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
                            .collection('Review')
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

                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                  'Belum ada pelanggan yang review restoranmu'),
                            );
                          }
                          final sortedDocs = snapshot.data!.docs
                              .map((doc) => doc.data() as Map<String, dynamic>)
                              .toList()
                            ..sort((a, b) {
                              final timestampA = a['timestamp'];
                              final timestampB = b['timestamp'];

                              if (timestampA == null || timestampB == null) {
                                return 0;
                              }

                              return timestampB.compareTo(timestampA);
                            });

                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              itemCount: sortedDocs.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> reviewData =
                                    sortedDocs[index];
                                double rating = reviewData['rate'] ?? 0.0;
                                dynamic timestamp = reviewData['timestamp'];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: CardReview(
                                    imageUrl: 'assets/users_init.png',
                                    username: reviewData['username'],
                                    rating: rating,
                                    timeUpload: timestamp,
                                    comments: '"${reviewData['commentText']}"',
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
