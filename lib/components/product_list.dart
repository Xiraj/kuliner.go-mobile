import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cart_model.dart';
import 'package:kuliner_go_mobile/components/cart_provider.dart';
import 'package:kuliner_go_mobile/components/cart_screen.dart';
import '../database/db_helperSQFlite.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  DBHelper? dbHelper = DBHelper();

  List<String> productName = [
    "Ayam Goreng",
    "Kentang Balado",
    "Ikan Pindang Tongkol",
    "Usus",
    "Nasi",
    "Es Teh Manis",
    "Es Teh Tarik",
    "Es Jeruk",
    "Air Mineral",
    "Soju",
  ];

  List<int> productPrice = [
    9000,
    6000,
    8000,
    7000,
    5000,
    5000,
    6000,
    3000,
    5000,
    90000,
  ];
  List<String> productImage = [
    'assets/products/1.png',
    'assets/products/2.png',
    'assets/products/3.png',
    'assets/products/4.png',
    'assets/products/5.png',
    'assets/products/6.png',
    'assets/products/7.png',
    'assets/products/8.png',
    'assets/products/9.png',
    'assets/products/10.png',
  ];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: ((context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: const TextStyle(color: Colors.white),
                    );
                  }),
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                productImage[index].toString(),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    productName[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    "Rp${productPrice[index]}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                InkWell(
                                  onTap: () {
                                    dbHelper!
                                        .insert(
                                      Cart(
                                        id: index,
                                        productId: index,
                                        productName:
                                            productName[index].toString(),
                                        initialPrice:
                                            productPrice[index].toDouble(),
                                        productPrice:
                                            productPrice[index].toDouble(),
                                        quantity: 1,
                                        image: productImage[index].toString(),
                                      ),
                                    )
                                        .then((value) {
                                      print('Menu telah ditambahkan');
                                      cart.addTotalPrice(
                                        double.parse(
                                          productPrice[index].toString(),
                                        ),
                                      );
                                      cart.addCounter();
                                    }).onError((error, stackTrace) {
                                      print(error.toString());
                                    });
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                        width: 0,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Tambahkan',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
