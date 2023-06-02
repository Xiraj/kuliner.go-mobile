import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuliner_go_mobile/components/cardCategory.dart';
import 'package:kuliner_go_mobile/components/cardResto.dart';
import 'package:kuliner_go_mobile/components/cardPopular.dart';
import 'package:kuliner_go_mobile/components/search.dart';
import 'package:kuliner_go_mobile/pages/near_resto_page.dart';
import 'package:kuliner_go_mobile/pages/popular_page.dart';
import 'package:kuliner_go_mobile/pages/restaurant_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? gender;
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
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Halo $username",
                    style: whiteTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kuliner.Go mempunyai lebih dari 1000 restoran",
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Search()
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(width: 1, color: greyColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  child: const RadioButton(),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.filter_alt_rounded,
                            color: greyColor,
                          ),
                          label: const Text(
                            "Filter",
                            style: TextStyle(color: greyColor),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              const Text("Buka Sekarang"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Image.asset('assets/price.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pilihan Kategori",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const cardCategory(
                          imageCategory: 'assets/aneka_nasi.png',
                          title: 'Aneka Nasi'),
                      const SizedBox(
                        width: 10,
                      ),
                      const cardCategory(
                          imageCategory: 'assets/minuman.png',
                          title: 'Minuman'),
                      const SizedBox(
                        width: 10,
                      ),
                      const cardCategory(
                          imageCategory: 'assets/seafood.png', title: 'Seafod'),
                      const SizedBox(
                        width: 10,
                      ),
                      const cardCategory(
                          imageCategory: 'assets/lainnya.png', title: 'Lainnya')
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Restoran Terdekat",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        alignment: const Alignment(0.7, 0.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NearResto()));
                          },
                          child: const Text(
                            'Lihat semua',
                            style: TextStyle(color: blueColor, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Restoran')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 380,
                          child: const Center(
                            child: SpinKitWave(
                              color: Colors.blue,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final docs = snapshot.data!.docs;
                      if (docs.isEmpty) {
                        return const Center(
                            child:
                                Text('Tidak ada data restoran yang ditemukan'));
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 460,
                            child: ListView.separated(
                              itemCount: docs.length > 3 ? 3 : docs.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final resto = docs[index];
                                final rate = rates[index];
                                final distance = distances[index];

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    restaurantPage(
                                                  resto: resto,
                                                ),
                                              ),
                                            );
                                          },
                                          child: CardResto(
                                            imageUrl: resto['imageUrl'],
                                            restoName: resto['username'],
                                            rate: rate,
                                            distance: distance,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text(
                                "Terpopuler minggu ini",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: const Alignment(0.7, 0.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PopularResto()));
                                  },
                                  child: const Text(
                                    'Lihat semua',
                                    style: TextStyle(
                                        color: blueColor, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 290,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const cardPopular(
                                  imagePopular: 'assets/warkop_add.jpg',
                                  restoName: 'Warkop ADD',
                                  distance: '1.6 km',
                                  time: '00.00 - 23.59',
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const cardPopular(
                                  imagePopular: 'assets/warkop_add.jpg',
                                  restoName: 'Warunk Uhuyy',
                                  distance: '2.2 km',
                                  time: '00.00 - 23.59',
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const cardPopular(
                                  imagePopular: 'assets/warkop_add.jpg',
                                  restoName: 'Jardin Cafe',
                                  distance: '3.4 km',
                                  time: '10.00 - 22.00',
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? selectedOption;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkKafe = false;
  bool checkKakiLima = false;
  bool checkBarLounge = false;
  bool checkKedai = false;
  bool checkFoodCourt = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 20),
              child: Text(
                "Urutkan Restoran Berdasarkan",
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            RadioListTile(
              title: const Text('Popularitas'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Jarak terdekat'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Harga termurah'),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Ulasan terbanyak'),
              value: 'Option 4',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Rating'),
              value: 'Option 5',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 20),
              child: Text(
                "Kisaran Harga Makanan",
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox1,
              title: const Text('Dibawah Rp75.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox1 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox2,
              title: const Text('Rp200.000 - Rp325.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox2 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox3,
              title: const Text('Rp325.000 - Rp450.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox3 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox4,
              title: const Text('di atas Rp450.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox4 = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 20),
              child: Text(
                "Tipe restoran",
                style: blackTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkKafe,
              title: const Text('Kafe'),
              onChanged: (bool? value) {
                setState(() {
                  checkKafe = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkKakiLima,
              title: const Text('Kaki lima'),
              onChanged: (bool? value) {
                setState(() {
                  checkKakiLima = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBarLounge,
              title: const Text('Bar & Lounge'),
              onChanged: (bool? value) {
                setState(() {
                  checkBarLounge = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkKedai,
              title: const Text('Kedai'),
              onChanged: (bool? value) {
                setState(() {
                  checkKedai = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkFoodCourt,
              title: const Text('Food Court'),
              onChanged: (bool? value) {
                setState(() {
                  checkFoodCourt = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 166,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Text('Reset',
                          style: TextStyle(
                              color: blueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 166,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF0190FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Text('Terapkan',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
