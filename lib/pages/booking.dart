import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/formAdd.dart';
import 'package:kuliner_go_mobile/pages/formDateTime.dart';
import 'package:kuliner_go_mobile/pages/menu_resto.dart';
import './formBooking.dart';
import 'home_bottomnav.dart';

// ignore: camel_case_types
class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _bookingPageState createState() => _bookingPageState();
}

// ignore: camel_case_types
class _bookingPageState extends State<bookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 24, left: 8),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homeBottomNav(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24, left: 64),
                  child: Text(
                    'Pesan Tempat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 25, top: 30),
                      child: Image(
                        image: AssetImage('assets/McDonalds_Logo.jpeg'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 18),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 99, top: 14),
                            child: Row(
                              children: [
                                Text(
                                  'McDonalds',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 134, top: 14),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '4.7 \t | \t',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                    Container(
                                      child: Image(
                                          image:
                                              AssetImage('assets/dollar.png')),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 55, top: 14),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '1.5 Km',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    '| Podomoro Park',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 215, top: 16),
                  child: Text(
                    'Data Pemesan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: Text(
                    "Pastikan nomor telepon dan email sudah benar",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: formBookingPage(),
                ),
                Container(
                  padding: EdgeInsets.only(right: 155, top: 16),
                  child: Text(
                    "Pilih Tanggal dan Jam",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: Text(
                    "Tentuin kapan kamu mau pesan tempatnya",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: formDateTimePage(),
                ),
                Container(
                  padding: EdgeInsets.only(right: 220, top: 16),
                  child: Text(
                    "Jumlah Orang",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 8),
                  width: 600,
                  child: Text(
                    "Ada berapa banyak orang yang mau ikut makan?",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: formAddPage(),
                ),
                SizedBox(height: 98),
                Center(
                  child: Container(
                    width: 354,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                          width: 0,
                        )),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuPage(),
                          ),
                        );
                      },
                      child: Text('Pilih menu'),
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}