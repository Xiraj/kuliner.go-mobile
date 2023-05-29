import 'package:badges/badges.dart' as badges;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cartModel.dart';
import 'package:kuliner_go_mobile/components/cart_provider.dart';
import 'package:kuliner_go_mobile/database/db_helper.dart';
import 'package:kuliner_go_mobile/pages/booking.dart';
import 'package:kuliner_go_mobile/pages/cart_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  DBHelper? dbHelper = DBHelper();

  List<String> nama_menu = [
    "Double Chesee Burger",
    "Panas 2 Spicy, Large",
    "Panas 1 Crispy, Medium",
    "Panas Special Spicy",
    "Panas Special Crispy",
    "Panas 2 Crispy, Large",
  ];

  List<int> harga_menu = [
    52000,
    50000,
    38000,
    46000,
    48000,
    46000,
  ];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    var badge = const badges.Badge();
    var harga;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 8),
                  child: TextButton(
                    onPressed: () {
                      
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 88),
                  child: Row(
                    children: [
                      const Text(
                        'Pilih Menu',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 92, top: 24),
                  child: badges.Badge(
                    badgeContent: Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return Text(
                          value.getCounter().toString(),
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Color(0xff0190ff),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 200, top: 30),
                  child: Text(
                    'Rekomendasi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                for (int i = 1; i <= 5; i++)
                  Container(
                    width: 400,
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: [
                        Image(image: AssetImage('assets/images/$i.png')),
                        Container(
                          width: 263.4,
                          padding: const EdgeInsets.only(left: 20, bottom: 24),
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                height: 20,
                                child: Text(
                                  nama_menu[i].toString(),
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 300,
                                height: 20,
                                child: Text(
                                  "Rp" + harga_menu[i].toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 125, top: 12),
                                child: ElevatedButton(
                                  onPressed: () {
                                    dbHelper?.insert(
                                      Cart(
                                        id: i,
                                        productId: i.toString(),
                                        nama_menu: nama_menu[i].toString(),
                                        initialPrice: harga_menu[i],
                                        harga_menu: harga_menu[i],
                                        quantity: 1,
                                      ).then((value) {
                                        print('Product telah ditambahkan');
                                        cart.addTotalPrice(double.parse(
                                            harga_menu[i].toString()));
                                        cart.addCounter();
                                      }).onError((error, stackTrace) {
                                        print("error" + error.toString());
                                      }),
                                    );
                                  },
                                  child: const Text(
                                    'Tambahkan',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 15),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(right: 200, top: 30),
                    child: Text(
                      'Aneka Ayam',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Column(
                  children: [
                    for (int i = 3; i <= 5; i++)
                      Container(
                        width: 400,
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/images/$i.png')),
                            Container(
                              width: 263.4,
                              padding: const EdgeInsets.only(left: 20, bottom: 24),
                              child: Column(
                                children: [
                                  Container(
                                    width: 300,
                                    height: 20,
                                    child: Text(
                                      nama_menu[i].toString(),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 300,
                                    height: 20,
                                    child: Text(
                                      "Rp" + harga_menu[i].toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(right: 125, top: 12),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        dbHelper?.insert(
                                          Cart(
                                            id: i,
                                            productId: i.toString(),
                                            nama_menu: nama_menu[i].toString(),
                                            initialPrice: harga_menu[i],
                                            harga_menu: harga_menu[i],
                                            quantity: 1,
                                          ).then((value) {
                                            print('Product telah ditambahkan');
                                            cart.addTotalPrice(double.parse(
                                                harga_menu[i].toString()));
                                            cart.addCounter();
                                          }).onError((error, stackTrace) {
                                            print("error" + error.toString());
                                          }),
                                        );
                                      },
                                      child: const Text(
                                        'Tambahkan',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}