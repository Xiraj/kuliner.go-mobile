import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/theme.dart';
import './booking.dart';
import '../components/ulasan.dart';
import '../components/custom_app_bar.dart';

class restaurantPage extends StatelessWidget {
  final DocumentSnapshot resto;
  const restaurantPage({super.key, required this.resto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  Icons.arrow_back_ios_outlined,
                  Icons.share,
                  Icons.favorite,
                ),
                Column(
                  children: [
                    Container(
                      color: whiteColor,
                      margin: const EdgeInsets.only(
                          left: 12.0, top: 15.0, right: 12.0, bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            resto['imageUrl'],
                            width: 260,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 20, top: 12),
                          child: Text(
                            '${resto['username']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 12, bottom: 20, top: 12),
                          child: Icon(
                            Icons.verified,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, bottom: 8),
                          child: Text(
                            'Buka Sekarang',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 210, bottom: 20),
                          child: Text(
                            'American Fast Food',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 230, bottom: 20),
                          child: Text(
                            'Detail Restoran',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 60,
                        child: Text(
                          '${resto['detailRestoran']}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Jam Buka'),
                          childrenPadding: EdgeInsets.only(left: 12),
                          leading: Icon(Icons.access_time),
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  width: 520,
                                  padding: EdgeInsets.only(left: 40, right: 30),
                                  child: Text(
                                    '${resto['jamBuka']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Kisaran Harga'),
                          childrenPadding: EdgeInsets.only(left: 12),
                          leading: Icon(Icons.attach_money_outlined),
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Image(
                                      image: AssetImage('assets/dollar.png')),
                                ),
                                title: Text(
                                  '\t | ${resto['kisaranHarga']}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Daftar Menu'),
                          leading: Icon(Icons.restaurant_menu_sharp),
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.only(left: 12),
                                  child: Image.asset('assets/menu1.png'),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.only(left: 12),
                                  child: Image.asset('assets/menu2.png'),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  padding: EdgeInsets.only(left: 12),
                                  child: Image.asset('assets/menu3.png'),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Alamat Restoran'),
                          childrenPadding: EdgeInsets.only(left: 12),
                          leading: Icon(Icons.location_on),
                          children: <Widget>[
                            Center(
                              child: Image.asset('assets/map.png'),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 520,
                                  padding: EdgeInsets.only(left: 40, right: 30),
                                  child: Text(
                                    '${resto['alamatRestoran']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Text('Fasilitas Restoran'),
                          leading: Icon(Icons.more_horiz_sharp),
                          children: <Widget>[
                            Container(
                              width: 520,
                              padding: EdgeInsets.only(left: 40, right: 30),
                              child: Text(
                                '${resto['fasilitasRestoran']}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, top: 12, right: 10.0, bottom: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Ulasan Restoran',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const Image(
                              image: AssetImage('assets/ulasanResto.png'))
                        ],
                      ),
                    ),
                    ulasanPage(),
                    SizedBox(height: 12),
                    Center(
                      child: Container(
                        width: 300,
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
                                    builder: (context) => const bookingPage()));
                          },
                          child: Text('Pesan Tempat'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16)
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.call),
      ),
    );
  }
}
