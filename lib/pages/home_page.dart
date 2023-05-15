import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
    // if currentUser is null, use "User" as the default username
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kuliner.Go mempunyai lebih dari 1000 restoran",
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Search()
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: greyColor),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  child: RadioButton(),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.filter_alt_rounded,
                            color: greyColor,
                          ),
                          label: Text(
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
                                BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Text("Buka Sekarang"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pilihan Kategori",
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      cardCategory(
                          imageCategory: 'assets/aneka_nasi.png',
                          title: 'Aneka Nasi'),
                      SizedBox(
                        width: 10,
                      ),
                      cardCategory(
                          imageCategory: 'assets/minuman.png',
                          title: 'Minuman'),
                      SizedBox(
                        width: 10,
                      ),
                      cardCategory(
                          imageCategory: 'assets/seafood.png', title: 'Seafod'),
                      SizedBox(
                        width: 10,
                      ),
                      cardCategory(
                          imageCategory: 'assets/lainnya.png', title: 'Lainnya')
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Restoran Terdekat",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
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
                  SizedBox(
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
                        return Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data!.docs;
                      if (docs.isEmpty) {
                        return Center(
                            child:
                                Text('Tidak ada data restoran yang ditemukan'));
                      }
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 320,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                final resto = docs[index];
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
                                            rate: "4.8",
                                            distance: "0.6",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Terpopuler minggu ini",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 290,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                cardPopular(
                                  imagePopular: 'assets/warkop_add.jpg',
                                  restoName: 'Warkop ADD',
                                  distance: '1.6 km',
                                  time: '00.00 - 23.59',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                cardPopular(
                                  imagePopular: 'assets/warkop_add.jpg',
                                  restoName: 'Warunk Uhuyy',
                                  distance: '2.2 km',
                                  time: '00.00 - 23.59',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                cardPopular(
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
              title: Text('Popularitas'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Jarak terdekat'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Harga termurah'),
              value: 'Option 3',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Ulasan terbanyak'),
              value: 'Option 4',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Rating'),
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
              title: Text('Dibawah Rp75.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox1 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox2,
              title: Text('Rp200.000 - Rp325.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox2 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox3,
              title: Text('Rp325.000 - Rp450.000'),
              onChanged: (bool? value) {
                setState(() {
                  checkbox3 = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox4,
              title: Text('di atas Rp450.000'),
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
              title: Text('Kafe'),
              onChanged: (bool? value) {
                setState(() {
                  checkKafe = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkKakiLima,
              title: Text('Kaki lima'),
              onChanged: (bool? value) {
                setState(() {
                  checkKakiLima = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBarLounge,
              title: Text('Bar & Lounge'),
              onChanged: (bool? value) {
                setState(() {
                  checkBarLounge = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkKedai,
              title: Text('Kedai'),
              onChanged: (bool? value) {
                setState(() {
                  checkKedai = value!;
                });
              },
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkFoodCourt,
              title: Text('Food Court'),
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
                        backgroundColor: Color(0XFFFAFAFA),
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
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 166,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF0190FF),
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
