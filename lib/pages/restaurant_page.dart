import 'package:flutter/material.dart';
import './booking.dart';
import './../components/alamat.dart';
import '../components/fasilitas.dart';
import '../components/jam.dart';
import '../components/ulasan.dart';
import '../components/harga.dart';
import '../components/custom_app_bar.dart';

// ignore: camel_case_types
class restaurantPage extends StatefulWidget {
  const restaurantPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _restaurantPageState createState() => _restaurantPageState();
}

// ignore: camel_case_types
class _restaurantPageState extends State<restaurantPage> {
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
                SafeArea(
                    child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                      left: 12.0, top: 15.0, right: 12.0, bottom: 10),
                  child: Column(
                    children: const <Widget>[
                      Image(
                        image: AssetImage('assets/McDonalds.png'),
                        width: 700,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20, top: 12),
                      child: Text(
                        'McDonalds',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, bottom: 20, top: 12),
                      child: Icon(
                        Icons.verified,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 60, bottom: 8),
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
                      padding: EdgeInsets.only(left: 20, bottom: 20),
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
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: Text(
                        'Detail Restaurant',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 320,
                    height: 80,
                    child: Text(
                      'Franchise makanan cepat saji klasik yang telah lama berdiri, terkenal dengan burger dan kentang gorengnya.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const jamPage(),
                const hargaPage(),
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
                const alamatPage(),
                const fasilitasPage(),
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
                      const Image(image: AssetImage('assets/ulasanResto.png'))
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
// ignore: camel_case_types
