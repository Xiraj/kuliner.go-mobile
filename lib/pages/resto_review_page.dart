import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/components/cardReview.dart';
import 'package:kuliner_go_mobile/theme.dart';

class RestoReviewList extends StatefulWidget {
  const RestoReviewList({super.key});

  @override
  State<RestoReviewList> createState() => _RestoReviewListState();
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
                      const CardReview(
                        imageUrl: 'assets/prof.png',
                        username: 'Alexander Yupo',
                        comments:
                            '“Penjual sangat ramah bintang 5, makanannya juga enak, harganya sangat cocok untuk kantong kita, cocok buat makan sama ayang, mantap pol!!”',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CardReview(
                        imageUrl: 'assets/prof2.png',
                        username: 'Charlie Van Houten',
                        comments:
                            '“Rasa makanannya enak banget, seperti buatan bunda, cocok buat yang homesick contohnya saya, ehhe”',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CardReview(
                        imageUrl: 'assets/prof3.png',
                        username: 'Mamang Garox',
                        comments:
                            '“Penjual sangat ramah bintang 5, makanannya juga enak, harganya sangat cocok untuk kantong kita, cocok buat makan sama ayang, mantap pol!!”',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CardReview(
                        imageUrl: 'assets/prof4.png',
                        username: 'Bolehhhh',
                        comments:
                            '“Penjual sangat ramah bintang 5, makanannya juga enak, harganya sangat cocok untuk kantong kita, cocok buat makan sama ayang, mantap pol!!”',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CardReview(
                        imageUrl: 'assets/prof5.png',
                        username: 'Jeremia Carlo :)',
                        comments:
                            '“Penjual sangat ramah bintang 5, makanannya juga enak, harganya sangat cocok untuk kantong kita, cocok buat makan sama ayang, mantap pol!!”',
                      ),
                      const SizedBox(
                        height: 20,
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
